package api

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"strings"
	"time"

	"database/sql"

	_ "webserver/docs"

	httpSwagger "github.com/swaggo/http-swagger"
)

const (
    API_HOST     = "localhost"
    API_PORT     = 1803
    API_BASE_URL = "/api/v1"

    LogsRoute = "/logs"
    AircraftRoute = "/aircrafts"
    SeatRoute = "/seats"
    AirportRoute = "/airports"
    UserRoute = "/users"
    PassengerRoute = "/passengers"
    FlightRoute = "/flights"
    BookingRoute = "/bookings"
    NewsRoute = "/news"
)

// Responds with a JSON
func respondWithJSON(r *http.Request, w http.ResponseWriter, status int, data interface{}) {
    w.Header().Set("Content-Type", "application/json")

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


func ApplyCSP(next http.Handler) http.HandlerFunc {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        if r.URL.Path == "/swagger/" || len(r.URL.Path) >= len("/swagger/") && r.URL.Path[:len("/swagger/")] == "/swagger/" {
            next.ServeHTTP(w, r)
            return
        }

        w.Header().Set("Access-Control-Allow-Origin", "*")
        // w.Header().Set("Access-Control-Allow-Credentials", "true")
        w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE")
        w.Header().Set("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization, Content-Length, Accept-Encoding, X-CSRF-Token, X-Api-Key")
        // w.Header().Set("Content-Security-Policy", "default-src *;")
        // w.Header().Set("Content-Security-Policy", "default-src *; connect-src *; style-src *;")
        // w.Header().Set("Content-Security-Policy", "default-src 'none'; connect-src *; script-src '*' 'unsafe-inline'; style-src '*' 'unsafe-inline';")
        w.Header().Set("Content-Security-Policy", "default-src *; connect-src *; script-src '*' 'unsafe-inline'; style-src '*' 'unsafe-inline';")

        if r.Method == http.MethodOptions {
            w.WriteHeader(http.StatusNoContent)
            return
        }

        next.ServeHTTP(w, r)
    })
}

// RegisterRoutes initializes all routes
func RegisterRoutes(db *sql.DB) http.HandlerFunc {
    // rand.Seed(time.Now().UnixNano())

    mux := http.NewServeMux()

    // Login and logout routes
    CleanSessionStore()
    mux.HandleFunc("/admin-login", HandleAdminLogin)
    mux.HandleFunc("/admin-logout", HandleAdminLogout)
    RegisterLogsRoutes(HandleAdminAuth, mux)

    // Register the Swagger UI
    mux.Handle("/swagger/", httpSwagger.WrapHandler)

    // Handle all 404 errors
    // Catch-all route handler
    // mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    //     respondWithJSON(r, w, http.StatusNotFound, map[string]string{"message": "dont go here"})
    // })

    // Register the API routes
    // mux.HandleFunc(
    //     "/",
    //     HandleAuth,
    // )

    // Register all database components

    RegisterAircraftsRoutes(db, mux)
    RegisterAirportsRoutes(db, mux)
    RegisterSeatsRoutes(db, mux)
    RegisterFlightsRoutes(db, mux)
    RegisterBookingsRoutes(db, mux)
    RegisterUsersRoutes(db, mux)
    RegisterPassengerRoutes(db, mux)
    RegisterNewsRoutes(db, mux)

    handler := ApplyCSP(mux)

    return handler
}