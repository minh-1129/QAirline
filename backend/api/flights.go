package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"strings"

	// "fmt"
	"net/http"
	"strconv"
	"time"
	"webserver/database"
)

// @Summary Get all flights
// @Description Get all flights
// @Tags flights
// @Accept json
// @Produce json
// @Success 200 {object} []database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights [get]
// GetAllFlights retrieves all flights
func GetAllFlights(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        flights, err := database.GetAllFlights(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, flights)
    }
}

// @Summary Create a new flight
// @Description Create a new flight
// @Tags flights
// @Accept json
// @Produce json
// @Param flight body database.Flight true "Flight object"
// @Success 201 {object} database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights [post]
// CreateFlight creates a new flight
func CreateFlight(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var flight database.Flight
        if err := json.NewDecoder(r.Body).Decode(&flight); err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create flight: %v", err)
            return
        }

        flightID, err := database.InsertFlight(db, &flight)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to create flight: %v", err)
            return
        }

        flight.FlightID = flightID
        respondWithJSON(r, w, http.StatusCreated, flight)
    }
}

// @Summary Get a flight by its ID
// @Description Get a flight by its ID
// @Tags flights
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Success 200 {object} database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 404 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/{flight_id} [get]
// GetFlightByID retrieves a flight by its ID
func GetFlightByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        // Get the flightID from the URL parameter and convert it to int
        flightIDStr := GetLastPath(r)
        flightID, err := strconv.Atoi(flightIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid flight ID"})
            log.Printf("Failed to get flight: %v", err)
            return
        }

        flight, err := database.GetFlightByID(db, flightID)
        if err != nil {
            respondWithJSON(r, w, http.StatusNotFound, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flight: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, flight)
    }
}

// @Summary Get a flight by its flight number
// @Description Get a flight by its flight number
// @Tags flights
// @Accept json
// @Produce json
// @Param flight_number path string true "Flight Number"
// @Success 200 {object} []database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/search/flight_number/{flight_number} [get]
// GetFlightByFlightNumber retrieves a flight by its flight number
func GetFlightsByFlightNumber(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        flightNumber := GetLastPath(r)
        if strings.TrimSpace(flightNumber) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "flight_number is required"})
            return
        }

        flights, err := database.GetFlightByFlightNumber(db, flightNumber)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flight: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, flights)
    }
}

// @Summary Update a flight
// @Description Update a flight
// @Tags flights
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param flight body database.Flight true "Flight object"
// @Success 200 {object} database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/{flight_id} [put]
// UpdateFlight updates an existing flight
func UpdateFlight(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        // Parse the flightID from the URL parameter and convert it to int
        flightIDStr := GetLastPath(r)
        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid flight ID"})
            log.Printf("Failed to update flight: %v", err)
            return
        }

        // Bind the incoming JSON to the Flight struct
        var flight database.Flight
        if err := json.NewDecoder(r.Body).Decode(&flight); err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update flight: %v", err)
            return
        }
        flight.FlightID = flightID

        // Call the UpdateFlight function to update the flight in the database
        err = database.UpdateFlight(db, &flight)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update flight: %v", err)
            return
        }

        // Return a success response
        respondWithJSON(r, w, http.StatusOK, flight)
    }
}

// @Summary Remove a flight
// @Description Remove a flight
// @Tags flights
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Success 200 {object} map[string]string "message"
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/{flight_id} [delete]
// RemoveFlight removes a flight by its ID
func RemoveFlight(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        // Parse the flight ID from the URL parameter and convert it to int
        flightIDStr := GetLastPath(r)
        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove flight: %v", err)
            return
        }

        // Call the database function to remove the flight
        err = database.RemoveFlight(db, flightID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove flight: %v", err)
            return
        }

        // Respond with a success message
        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Flight deleted successfully"})
    }
}

// @Summary Get flights by departure and arrival airports
// @Description Get flights by departure and arrival airports
// @Tags flights
// @Accept json
// @Produce json
// @Param departure query string true "Departure Airport"
// @Param arrival query string true "Arrival Airport"
// @Success 200 {object} []database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/search [get]
// GetFlightsByDeAndArrAirport retrieves flights based on departure and arrival airports
func GetFlightsByDeAndArrAirport(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        departureAirport := r.URL.Query().Get("departure")
        arrivalAirport := r.URL.Query().Get("arrival")

        flights, err := database.GetFlightsByDeAndArrAirport(db, departureAirport, arrivalAirport)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, flights)
    }
}

// @Summary Get flights by departure and arrival airports and departure time
// @Description Get flights by departure and arrival airports and departure time
// @Tags flights
// @Accept json
// @Produce json
// @Param departure query string true "Departure Airport"
// @Param arrival query string true "Arrival Airport"
// @Param departure_time query string true "Departure Time" Format(date-time)
// @Success 200 {object} []database.Flight
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/search/oneway [get]
// GetFlightsByDeAndArrAirportAndDepTime retrieves flights based on departure and arrival airports and departure time
func GetFlightsByDeAndArrAirportAndDepTime(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        departureAirport := r.URL.Query().Get("departure")
        arrivalAirport := r.URL.Query().Get("arrival")
        departureTimeStr := r.URL.Query().Get("departure_time")

        if strings.TrimSpace(departureTimeStr) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "departure_time is required"})
            return
        }

        departureTime, err := time.Parse(time.RFC3339, departureTimeStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        flights, err := database.GetFlightsByDeAndArrAirportAndDepTime(db, departureAirport, arrivalAirport, departureTime)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, flights)
    }
}

// GetRoundTripFlightsByDeAndArrAirportAndTime retrieves both departing and return flights
// GetRoundTripFlightsByDeAndArrAirportAndTime handles the HTTP request to fetch round-trip flights based on departure and arrival airports and times.
// @Summary Get round-trip flights
// @Description Fetch round-trip flights based on departure and arrival airports and times
// @Tags flights
// @Produce json
// @Param departure query string true "Departure Airport"
// @Param arrival query string true "Arrival Airport"
// @Param departure_time query string true "Departure Time" Format(date-time)
// @Param return_time query string true "Return Time" Format(date-time)
// @Success 200 {object} map[string]interface{} "departing_flights and return_flights"
// @Failure 400 {object} map[string]string "error"
// @Failure 500 {object} map[string]string "error"
// @Router /api/v1/flights/roundtrip [get]
func GetRoundTripFlightsByDeAndArrAirportAndTime(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        departureAirport := r.URL.Query().Get("departure")
        arrivalAirport := r.URL.Query().Get("arrival")
        departureTimeStr := r.URL.Query().Get("departure_time")
        returnTimeStr := r.URL.Query().Get("return_time")

        if strings.TrimSpace(departureTimeStr) == "" || strings.TrimSpace(returnTimeStr) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "departure_time and return_time are required"})
            return
        }

        departureTime, err := time.Parse(database.TIME_LAYOUT, departureTimeStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        returnTime, err := time.Parse(database.TIME_LAYOUT, returnTimeStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        departingFlights, returnFlights, err := database.GetRoundTripFlightsByDeAndArrAirportAndTime(db, departureAirport, arrivalAirport, departureTime, returnTime)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get flights: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]interface{}{
            "departing_flights": departingFlights,
            "return_flights":    returnFlights,
        })
    }
}

// RegisterFlightsRoutes registers flights routes
func RegisterFlightsRoutes(db *sql.DB) {
    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute)),
        GetAllFlights(db),
    )
    http.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, FlightRoute)),
        CreateFlight(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "{flight_id}")),
        GetFlightByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "{flight_id}")),
        UpdateFlight(db),
    )
    http.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "{flight_id}")),
        RemoveFlight(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "search/flight_number")),
        GetFlightsByFlightNumber(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "search")),
        GetFlightsByDeAndArrAirport(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "search/oneway")),
        GetFlightsByDeAndArrAirportAndDepTime(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, FlightRoute, "search/roundtrip")),
        GetRoundTripFlightsByDeAndArrAirportAndTime(db),
    )
}