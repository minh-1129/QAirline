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

	// "time"
	"webserver/database"
)

// @Summary Create a booking
// @Description Create a booking
// @Tags bookings
// @Accept json
// @Produce json
// @Param booking body database.Booking true "Booking object"
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings [post]
// CreateBooking creates a new booking
func CreateBooking(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var booking database.Booking
        err := json.NewDecoder(r.Body).Decode(&booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create booking: %v\n", err)
            return
        }

        bookingID, err := database.InsertBooking(db, &booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to create booking: %v\n", err)
            return
        }

        booking.BookingID = bookingID
        respondWithJSON(r, w, http.StatusCreated, booking)
    }
}

// @Summary Get booking by ID
// @Description Get booking by ID
// @Tags bookings
// @Accept json
// @Produce json
// @Param booking_id path int true "Booking ID"
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings/search/booking/{booking_id} [get]
// Get booking by ID
func GetBookingByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookingIDStr := GetLastPath(r)
        bookingID, err := strconv.Atoi(bookingIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get booking: %v\n", err)
            return
        }

        booking, err := database.GetBookingByID(db, bookingID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get booking: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, booking)
    }
}

// @Summary Get booking by flight ID
// @Description Get booking by flight ID
// @Tags bookings
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Success 200 {object} []database.Booking
// @Router /api/v1/bookings/search/flight/{flight_id} [get]
// Get booking by flight ID
func GetBookingByFlightID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        flightIDStr := GetLastPath(r)
        flightID, err := strconv.Atoi(flightIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get booking: %v\n", err)
            return
        }

        bookings, err := database.GetBookingByFlightID(db, flightID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get booking: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, bookings)
    }
}

// @Summary Get booking by citizen ID
// @Description Get booking by citizen ID
// @Tags bookings
// @Accept json
// @Produce json
// @Param citizen_id path string true "Citizen ID"
// @Success 200 {object} []database.Booking
// @Router /api/v1/bookings/search/citizen/{citizen_id} [get]
// Get booking by citizen ID
func GetBookingByCitizenID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        citizenID := GetLastPath(r)

        if (strings.TrimSpace(citizenID) == "") {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Citizen ID is required"})
            return
        }

        bookings, err := database.GetBookingByCitizenID(db, citizenID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get booking: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, bookings)
    }
}

// @Summary Update a booking
// @Description Update a booking
// @Tags bookings
// @Accept json
// @Produce json
// @Param booking_id path string true "Booking ID"
// @Param booking body database.Booking true "Booking object"
// @Success 200 {object} database.Booking
// @Success 404 {object} map[string]string
// @Router /api/v1/bookings/{booking_id} [put]
// UpdateBooking updates a booking
func UpdateBooking(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookingIDStr := GetLastPath(r)
        bookingID, err := strconv.Atoi(bookingIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update booking: %v\n", err)
            return
        }

        var booking database.Booking
        err = json.NewDecoder(r.Body).Decode(&booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update booking: %v\n", err)
            return
        }
        booking.BookingID = bookingID

        err = database.UpdateBooking(db, &booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update booking: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, booking)
    }
}

// @Summary Remove a booking
// @Description Remove a booking
// @Tags bookings
// @Accept json
// @Produce json
// @Param booking_id path string true "Booking ID"
// @Success 200 {object} map[string]string
// @Router /api/v1/bookings/{booking_id} [delete]
// DeleteBooking deletes a booking
func DeleteBooking(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookingIDStr := GetLastPath(r)
        bookingID, err := strconv.Atoi(bookingIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete booking: %v\n", err)
            return
        }

        err = database.RemoveBooking(db, bookingID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete booking: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Booking deleted successfully"})
    }
}

// @Summary Get all bookings
// @Description Get all bookings
// @Tags bookings
// @Accept json
// @Produce json
// @Success 200 {object} []database.Booking
// @Router /api/v1/bookings [get]
// Get all bookings
func GetAllBookings(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookings, err := database.GetAllBookings(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get bookings: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, bookings)
    }
}

// RegisterBookingsRoutes initializes all booking routes
func RegisterBookingsRoutes(db *sql.DB) {
    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, BookingRoute)),
        GetAllBookings(db),
    )
    http.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, BookingRoute)),
        CreateBooking(db),
    )
    http.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, BookingRoute, "{booking_id}")),
        UpdateBooking(db),
    )
    http.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, BookingRoute, "{booking_id}")),
        DeleteBooking(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, BookingRoute, "search/booking", "{booking_id}")),
        GetBookingByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, BookingRoute, "search/flight/flight_id", "{flight_id}")),
        GetBookingByFlightID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, BookingRoute, "search/citizen", "{citizen_id}")),
        GetBookingByCitizenID(db),
    )
}