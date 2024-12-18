package api

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"math/rand/v2"
	"net/http"
	"net/url"
	"strings"
	"time"

	"database/sql"

	_ "webserver/docs"

	httpSwagger "github.com/swaggo/http-swagger"
)

const (
    USERNAME = "admin"
    PASSWORD = "admin"

    API_HOST     = "localhost"
    API_PORT     = 1803
    API_BASE_URL = "/api/v1"

    LogsRoute = "/logs"
    AircraftRoute = "/aircrafts"
    AirportRoute = "/airports"
    UserRoute = "/users"
    PassengerRoute = "/passengers"
    FlightRoute = "/flights"
    BookingRoute = "/bookings"
)

var sessionStore = make(map[string]string)

// Generate session ID
func GenerateSessionID() string {
    return fmt.Sprintf("%d", rand.Int())
}

// Responds with a JSON
func respondWithJSON(r *http.Request, w http.ResponseWriter, status int, data interface{}) {
    w.Header().Set("Content-Type", "application/json")
    w.Header().Add("Access-Control-Allow-Origin", "*")
    w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE")
    w.Header().Add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization, Content-Length, Accept-Encoding, X-CSRF-Token, X-Api-Key")
    w.Header().Set("Content-Security-Policy", "default-src 'self';")

    w.WriteHeader(status)
    // Beautify the JSON with MarshalIndent
    response, err := json.MarshalIndent(data, "", "    ")
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }

    // log the response
    fmt.Println(time.Now().Format("[15:04:05 02/01/2006]"), r.Method, r.URL.Path, status)

    // Write the beautified JSON response
    w.Write(response)
}

// Get the last URL path
func GetLastPath(r *http.Request) string {
    splitPaths := strings.Split(r.URL.Path, "/")
    return splitPaths[len(splitPaths) - 1]
}

// GetJoinedPath joins the URL paths
func GetJoinedPath(paths ...string) string {
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", API_HOST, API_PORT),
    }

    return url.JoinPath(paths...).Path
}

// Validate authentication
func HandleAuth(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        // Get session cookie
        sessionCookie, err := r.Cookie("session")
        if err != nil || sessionStore[sessionCookie.Value] == "" {
            // w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
            respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
            return
        }

        next(w, r)
    }
}

// Handle login
func HandleLogin(w http.ResponseWriter, r *http.Request) {
    authHeader := r.Header.Get("Authorization")

    if (authHeader == "") {
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
        return
    }

    // verify the header format
    parts := strings.SplitN(authHeader, " ", 2)
    if len(parts) != 2 || parts[0] != "Basic" {
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
        return
    }

    // decode the base64 payload
    payload, err := base64.StdEncoding.DecodeString(parts[1])
    if err != nil {
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
        return
    }

    // check credentials
    creds := strings.SplitN(string(payload), ":", 2)
    if len(creds) != 2 || creds[0] != USERNAME || creds[1] != PASSWORD {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{"message": "Unauthorized"})
        return
    }

    // Get the session cookie
    sessionCookie, err := r.Cookie("session_id")
    if err != nil {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{
            "message": "Unauthorized",
            "cookie":  sessionStore[sessionCookie.Value],
            "session": sessionCookie.Value,
        })
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        return
    }

    if sessionStore[sessionCookie.Value] == "" {
        respondWithJSON(r, w, http.StatusUnauthorized, map[string]string{
            "message": "Unauthorized token",
            "cookie":  sessionStore[sessionCookie.Value],
            "session": sessionCookie.Value,
        })
        w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
        return
    }

    // if sessionStore[sessionCookie.Value] != "" {
    //     respondWithJSON(r, w, http.StatusOK, map[string]string{
    //         "message": "Authorized",
    //         "cookie":  sessionStore[sessionCookie.Value],
    //         "session": sessionCookie.Value,
    //     })
    //     w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
    //     return
    // }

    // Generate and store session
    sessionID := GenerateSessionID()
    sessionStore[sessionID] = creds[0]

    // Set session cookie
    http.SetCookie(w, &http.Cookie{
        Name:     "session_id",
        Value:    sessionID,
        HttpOnly: true,
        Secure:   false, // Use true in production with HTTPS
        SameSite: http.SameSiteStrictMode,
    })

    respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Authorized"})
}

// Handle logout
func HandleLogout(w http.ResponseWriter, r *http.Request) {
    // Get the session cookie
    sessionCookie, err := r.Cookie("session_id")
    if err == nil {
        delete(sessionStore, sessionCookie.Value)
    }

    // Delete the session cookie
    http.SetCookie(w, &http.Cookie{
        Name:     "session_id",
        Value:    "",
        HttpOnly: true,
        Secure:   false, // Use true in production with HTTPS
        SameSite: http.SameSiteStrictMode,
        MaxAge:   0,
    })

    respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Logged out"})

    w.Header().Set("Authorization", "")
    w.Header().Set("WWW-Authenticate", `Basic realm="Restricted Area"`)
}

// RegisterRoutes initializes all routes
func RegisterRoutes(db *sql.DB) {
    // rand.Seed(time.Now().UnixNano())

    // Login and logout routes
    http.HandleFunc("/login", HandleLogin)
    http.HandleFunc("/logout", HandleLogout)

    // Register the Swagger UI
    http.Handle("/swagger/", httpSwagger.WrapHandler)

    // Handle all 404 errors
    // Catch-all route handler
    // http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    //     respondWithJSON(r, w, http.StatusNotFound, map[string]string{"message": "dont go here"})
    // })

    // Register the API routes
    // http.HandleFunc(
    //     "/",
    //     HandleAuth,
    // )

    // Register all database components
    RegisterLogsRoutes(HandleAuth)

    RegisterFlightsRoutes(db)
    RegisterAirportsRoutes(db)
    RegisterAircraftsRoutes(db)
    RegisterBookingsRoutes(db)
    RegisterUsersRoutes(db)
    RegisterPassengerRoutes(db)
}