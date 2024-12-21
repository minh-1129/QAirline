package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"

	// "fmt"
	"net/http"
	"strconv"

	// "time"
	"webserver/database"
)

// @Summary Create a passenger
// @Description Create a passenger
// @Tags passengers
// @Accept json
// @Produce json
// @Param passenger body database.Passenger true "Passenger object"
// @Success 200 {object} database.Passenger
// @Router /api/v1/passengers [post]
// CreatePassenger creates a new passenger
func CreatePassenger(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var passenger database.Passenger
        err := json.NewDecoder(r.Body).Decode(&passenger)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create passenger: %v\n", err)
            return
        }

        passengerID, err := database.InsertPassenger(db, &passenger)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to create passenger: %v\n", err)
            return
        }

        passenger.PassengerID = passengerID
        respondWithJSON(r, w, http.StatusCreated, passenger)
    }
}

// @Summary Get passenger by ID
// @Description Get passenger by ID
// @Tags passengers
// @Accept json
// @Produce json
// @Param passenger_id path int true "Passenger ID"
// @Success 200 {object} database.Passenger
// @Router /api/v1/passengers/passenger/{passenger_id} [get]
// GetPassengerByID retrieves a passenger by their ID
func GetPassengerByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        passengerIDStr := GetLastPath(r)
        passengerID, err := strconv.Atoi(passengerIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get passenger: %v\n", err)
            return
        }

        passenger, err := database.GetPassengerByID(db, passengerID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get passenger: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, passenger)
    }
}

// @Summary Update passenger by ID
// @Description Update passenger by ID
// @Tags passengers
// @Accept json
// @Produce json
// @Param passenger_id path int true "Passenger ID"
// @Param passenger body database.Passenger true "Passenger object"
// @Success 200 {object} database.Passenger
// @Router /api/v1/passengers/passenger/{passenger_id} [put]
// UpdatePassenger updates a passenger by their ID
func UpdatePassenger(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        passengerIDStr := GetLastPath(r)
        passengerID, err := strconv.Atoi(passengerIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update passenger: %v\n", err)
            return
        }

        var passenger database.Passenger
        err = json.NewDecoder(r.Body).Decode(&passenger)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update passenger: %v\n", err)
            return
        }

        passenger.PassengerID = passengerID
        err = database.UpdatePassenger(db, &passenger)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update passenger: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, passenger)
    }
}

// @Summary Remove a passenger
// @Description Remove a passenger
// @Tags passengers
// @Accept json
// @Produce json
// @Param passenger_id path int true "Passenger ID"
// @Success 200 {object} map[string]string
// @Router /api/v1/passengers/passenger/{passenger_id} [delete]
// RemovePassenger removes a passenger by their ID
func RemovePassenger(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        passengerIDStr := GetLastPath(r)
        passengerID, err := strconv.Atoi(passengerIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove passenger: %v\n", err)
            return
        }

        err = database.RemovePassenger(db, passengerID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove passenger: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "passenger removed successfully"})
    }
}

// @Summary Get all passengers
// @Description Get all passengers
// @Tags passengers
// @Accept json
// @Produce json
// @Success 200 {object} []database.Passenger
// @Router /api/v1/passengers [get]
// GetAllPassengers retrieves all passengers from the 'passengers' table
func GetAllPassengers(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        passengers, err := database.GetAllPassengers(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get passengers: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, passengers)
    }
}

// @Summary Get all passengers by booking ID
// @Description Get all passengers by booking ID
// @Tags passengers
// @Accept json
// @Produce json
// @Param booking_id path int true "Booking ID"
// @Success 200 {object} []database.Passenger
// @Router /api/v1/passengers/booking/{booking_id} [get]
// GetPassengersByBookingID retrieves all passengers by their booking ID
func GetPassengersByBookingID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookingIDStr := GetLastPath(r)
        bookingID, err := strconv.Atoi(bookingIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get passengers: %v\n", err)
            return
        }

        passengers, err := database.GetPassengersByBookingID(db, bookingID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get passengers: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, passengers)
    }
}

// RegisterPassengerRoutes initializes all passenger routes
func RegisterPassengerRoutes(db *sql.DB, mux *http.ServeMux) {
    // Register the API routes
    mux.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, PassengerRoute)),
        CreatePassenger(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, PassengerRoute, "passenger", "{passenger_id}")),
        UpdatePassenger(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, PassengerRoute, "passenger", "{passenger_id}")),
        RemovePassenger(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, PassengerRoute, "passenger", "{passenger_id}")),
        GetPassengerByID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, PassengerRoute)),
        GetAllPassengers(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, PassengerRoute, "booking", "{booking_id}")),
        GetPassengersByBookingID(db),
    )
}