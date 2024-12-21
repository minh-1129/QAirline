package api

import (
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
	"math/rand/v2"
	"net/http"
	"os"

	// "os"
	"strings"
	"sync"
)

const (
    ADMIN_USERNAME = "admin"
    ADMIN_PASSWORD = "admin"
)

var(
    sessionStore = make(map[string]string)
    mu sync.Mutex
)

const sessionPath = "api/session_store.json"

// Generate session ID
func GenerateSessionID() string {
    return fmt.Sprintf("%d", rand.Int())
}

func saveSessionStore() {
    // Save session store to a file
    mu.Lock()
    defer mu.Unlock()

    sessionStoreJson, err := json.Marshal(sessionStore)
    if err != nil {
        log.Printf("Error marshalling session store: %v\n", err)
        return
    }

    os.WriteFile(sessionPath, sessionStoreJson, 0644)
}

func loadSessionStore() {
    // Load session store from a file
    // sessionStore = make(map[string]string)
    mu.Lock()
    defer mu.Unlock()

    sessionStoreJson, err := os.ReadFile(sessionPath)
    if err != nil {
        log.Printf("Error reading session store: %v\n", err)
        return
    }

    err = json.Unmarshal(sessionStoreJson, &sessionStore)
    if err != nil {
        log.Printf("Error unmarshalling session store: %v\n", err)
        return
    }
}

// Clean session store
func CleanSessionStore() {
    sessionStore = make(map[string]string)
    saveSessionStore()
}

func HashString(s string) string {
    h := md5.New()
    h.Write([]byte(s))
    return hex.EncodeToString(h.Sum(nil))
}

// Validate authentication
func HandleAdminAuth(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        // Get session cookie
        loadSessionStore()
        hashedRemoteAddr := HashString(r.RemoteAddr)
        sessionCookie, err := r.Cookie("session_id")
        if err != nil || sessionStore[hashedRemoteAddr] != sessionCookie.Value {
            respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
            return
        }

        next(w, r)
    }
}

// Login handler
func HandleAdminLogin(w http.ResponseWriter, r *http.Request) {
    // if r.Method != http.MethodPost {
    //     respondWithJSON(r, w, http.StatusMethodNotAllowed, map[string]string{"error": "Method not allowed"})
    //     return
    // }

    authHeader := r.Header.Get("Authorization")
    if authHeader == "" {
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Unauthorized"})
        return
    }

    // Verify the Authorization header format
    parts := strings.SplitN(authHeader, " ", 2)
    if len(parts) != 2 || parts[0] != "Basic" {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Invalid authorization header"})
        return
    }

    // Decode the base64 payload
    payload, err := base64.StdEncoding.DecodeString(parts[1])
    if err != nil {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Invalid base64 encoding"})
        return
    }

    // Split credentials into username and password
    creds := strings.SplitN(string(payload), ":", 2)
    if len(creds) != 2 || creds[0] != ADMIN_USERNAME || creds[1] != ADMIN_PASSWORD {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Invalid credentials"})
        return
    }

    loadSessionStore()
    cookie, err := r.Cookie("session_id")
    hashedRemoteAddr := HashString(r.RemoteAddr)
    if err == nil && sessionStore[hashedRemoteAddr] == cookie.Value {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Already logged in"})
        return
    }
    if sessionStore[hashedRemoteAddr] != "" && sessionStore[hashedRemoteAddr] != cookie.Value {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Invalid session ID"})
        return
    }

    // Generate a session ID and store it
    sessionID := GenerateSessionID()
    sessionStore[hashedRemoteAddr] = sessionID // Store the username

    // Set session cookie
    http.SetCookie(w, &http.Cookie{
        Name:     "session_id",
        Value:    sessionID,
        HttpOnly: true,
        Secure:   false, // Use true in production with HTTPS
        SameSite: http.SameSiteStrictMode,
    })

    respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Login successful"})

    // Save session store
    saveSessionStore()
}

// Logout handler
func HandleAdminLogout(w http.ResponseWriter, r *http.Request) {
    // if r.Method != http.MethodPost {
    //     respondWithJSON(r, w, http.StatusMethodNotAllowed, map[string]string{"error": "Method not allowed"})
    //     return
    // }

    // load session store
    loadSessionStore()

    hashedRemoteAddr := HashString(r.RemoteAddr)

    // Get the session cookie
    cookie, err := r.Cookie("session_id")
    if err != nil {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "No session cookie found"})
        return
    }
    if sessionStore[hashedRemoteAddr] != cookie.Value {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"error": "Invalid session ID"})
        return
    }

    // Delete the session cookie
    http.SetCookie(w, &http.Cookie{
        Name:     "session_id",
        Value:    "",
        HttpOnly: true,
        Secure:   false, // Use true in production with HTTPS
        SameSite: http.SameSiteStrictMode,
        MaxAge:   -1,
    })
    delete(sessionStore, hashedRemoteAddr)

    respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Logout successful"})

    w.Header().Set("Authorization", "")
    w.Header().Set("WWW-Authenticate", "")

    saveSessionStore()
}