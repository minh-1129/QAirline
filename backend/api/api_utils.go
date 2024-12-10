package api

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"time"

	"database/sql"

	_ "webserver/docs"

	httpSwagger "github.com/swaggo/http-swagger"
)

const (
    API_HOST     = "localhost"
    API_PORT     = 1803
    API_BASE_URL = "/api/v1"

    FlightRoute = "/flights"
    AirportRoute = "/airports"
    BookingRoute = "/bookings"
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

// RegisterRoutes initializes all routes
func RegisterRoutes(db *sql.DB) {
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", API_HOST, API_PORT),
    }

    // Register the Swagger UI
    http.Handle("/swagger/", httpSwagger.WrapHandler)

    // Handle all 404 errors
    // Catch-all route handler
    // http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    //     respondWithJSON(r, w, http.StatusNotFound, map[string]string{"message": "dont go here"})
    // })

    // Register the API routes
    http.HandleFunc(
        url.JoinPath(API_BASE_URL, "/").Path,
        func(w http.ResponseWriter, r *http.Request) {
            respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "hello world"})
        },
    )

    // Register all database components
    RegisterFlightsRoutes(db)
    RegisterAirportsRoutes(db)
}
