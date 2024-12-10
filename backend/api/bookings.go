package api

import (
    "database/sql"
    "encoding/json"
    "fmt"
    "strings"

    // "fmt"
    "net/http"
    "net/url"
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
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid request payload"})
            return
        }

        bookingID, err := database.InsertBooking(db, &booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to create booking"})
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
// @Param booking_id query int true "Booking ID"
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings/search/booking [get]
// Get booking by ID
func GetBookingByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        query := r.URL.Query()
        booking_id, err := strconv.Atoi(query.Get("booking_id"))
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid booking ID"})
            return
        }
        if booking_id == 0 {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid booking ID"})
            return
        }

        booking, err := database.GetBookingByID(db, booking_id)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get booking by ID"})
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
// @Param flight_id query int true "Flight ID"
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings/search/flight [get]
// Get booking by flight ID
func GetBookingByFlightID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        query := r.URL.Query()
        flight_id, err := strconv.Atoi(query.Get("flight_id"))
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid flight ID"})
            return
        }
        if flight_id == 0 {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid flight ID"})
            return
        }

        bookings, err := database.GetBookingByFlightID(db, flight_id)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get booking by flight ID"})
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
// @Param citizen_id query string true "Citizen ID"
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings/search/citizen [get]
// Get booking by citizen ID
func GetBookingByCitizenID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        query := r.URL.Query()
        citizen_id, err := strconv.Atoi(query.Get("citizen_id"))
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid citizen ID"})
            return
        }
        if citizen_id == 0 {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid citizen ID"})
            return
        }

        bookings, err := database.GetBookingByCitizenID(db, citizen_id)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get booking by citizen ID"})
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
        bookingIDStr := strings.Split(r.URL.Path, "/")[len(strings.Split(r.URL.Path, "/"))-1]
        bookingID, err := strconv.Atoi(bookingIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid booking ID"})
            return
        }

        var booking database.Booking
        err = json.NewDecoder(r.Body).Decode(&booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid request payload"})
            return
        }
        booking.BookingID = bookingID

        err = database.UpdateBooking(db, &booking)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to update booking"})
            return
        }

        respondWithJSON(r, w, http.StatusOK, booking)
    }
}

// @Summary Delete a booking
// @Description Delete a booking
// @Tags bookings
// @Accept json
// @Produce json
// @Param booking_id path string true "Booking ID"
// @Success 200 {object} map[string]string
// @Router /api/v1/bookings/{booking_id} [delete]
// DeleteBooking deletes a booking
func DeleteBooking(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookingIDStr := strings.Split(r.URL.Path, "/")[len(strings.Split(r.URL.Path, "/"))-1]
        bookingID, err := strconv.Atoi(bookingIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"message": "Invalid booking ID"})
            return
        }

        err = database.RemoveBooking(db, bookingID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to delete booking"})
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
// @Success 200 {object} database.Booking
// @Router /api/v1/bookings [get]
// Get all bookings
func GetAllBookings(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        bookings, err := database.GetAllAirports(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get bookings"})
            return
        }

        respondWithJSON(r, w, http.StatusOK, bookings)
    }
}

// RegisterBookingsRoutes initializes all booking routes
func RegisterBookingsRoutes(db *sql.DB) {
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", API_HOST, API_PORT),
    }

    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET %s", url.JoinPath(API_BASE_URL, BookingRoute).Path),
        GetAllBookings(db),
    )
    http.HandleFunc(
        fmt.Sprintf("POST %s", url.JoinPath(API_BASE_URL, BookingRoute, "{booking_id}").Path),
        CreateBooking(db),
    )
    http.HandleFunc(
        fmt.Sprintf("PUT %s", url.JoinPath(API_BASE_URL, BookingRoute, "{booking_id}").Path),
        UpdateBooking(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET %s", url.JoinPath(API_BASE_URL, BookingRoute, "search/booking", "{booking_id}").Path),
        GetBookingByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET %s", url.JoinPath(API_BASE_URL, BookingRoute, "search/flight", "{flight_id}").Path),
        GetBookingByFlightID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET %s", url.JoinPath(API_BASE_URL, BookingRoute, "search/citizen", "{citizen_id}").Path),
        GetBookingByCitizenID(db),
    )
}