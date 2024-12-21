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
    AirportRoute = "/airports"
    UserRoute = "/users"
    PassengerRoute = "/passengers"
    FlightRoute = "/flights"
    BookingRoute = "/bookings"
)

// Responds with a JSON
func respondWithJSON(r *http.Request, w http.ResponseWriter, status int, data interface{}) {
    w.Header().Set("Content-Type", "application/json")
    w.Header().Add("Access-Control-Allow-Origin", "*")
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

// RegisterRoutes initializes all routes
func RegisterRoutes(db *sql.DB) {
    // Register the Swagger UI
    http.Handle("/swagger/", httpSwagger.WrapHandler)

    // Handle all 404 errors
    // Catch-all route handler
    // http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    //     respondWithJSON(r, w, http.StatusNotFound, map[string]string{"message": "dont go here"})
    // })

    // Register the API routes
    http.HandleFunc(
        GetJoinedPath(API_BASE_URL, "/"),
        func(w http.ResponseWriter, r *http.Request) {
            respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "hello world"})
        },
    )

    // Register all database components
    RegisterLogsRoutes()

    RegisterFlightsRoutes(db)
    RegisterAirportsRoutes(db)
    RegisterAircraftsRoutes(db)
    RegisterBookingsRoutes(db)
    RegisterUsersRoutes(db)
    RegisterPassengerRoutes(db)
}