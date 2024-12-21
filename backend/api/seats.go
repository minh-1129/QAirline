package api

import (
	"database/sql"
	"encoding/json"
	"fmt"

	// "fmt"
	"log"
	"strings"

	"net/http"
	"strconv"
	"webserver/database"
)

// @Summary Create seats by flight and aircraft ID from an array
// @Description Create seats by flight and aircraft ID  from an array
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Success 201 {object} []database.Seat
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id} [post]
func CreateSeatsByFlightAndAircraftIDArray(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 3]
        aircraftIDStr := splitStrings[len(splitStrings) - 1]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }

        seats := []database.Seat{}
        err = json.NewDecoder(r.Body).Decode(&seats)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }

        seats, err = database.BulkInsertSeats(db, flightID, aircraftID, seats)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusCreated, seats)
    }
}

// @Summary Create seats by flight and aircraft ID from capacity
// @Description Create seats by flight and aircraft ID from capacity
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Param capacity path int true "Capacity"
// @Success 201 {object} []database.Seat
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id}/capacity/{capacity} [post]
func CreateSeatsByFlightAndAircraftIDCapacity(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 5]
        aircraftIDStr := splitStrings[len(splitStrings) - 3]
        capacityStr := splitStrings[len(splitStrings) - 1]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }
        capacity, err := strconv.Atoi(capacityStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }

        seats, err := database.BulkInsertSeatsFromCapacity(db, flightID, aircraftID, capacity)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusCreated, seats)
    }
}

// @Summary Get all seats by flight and aircraft ID
// @Description Get all seats by flight and aircraft ID
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Success 200 {array} database.Seat
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id} [get]
func GetSeatsByFlightAndAircraftID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 3]
        aircraftIDStr := splitStrings[len(splitStrings) - 1]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }

        seats, err := database.GetSeatsByFlightAndAircraftID(db, flightID, aircraftID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seats)
    }
}

// @Summary Get seat by ID
// @Description Get seat by ID
// @Tags seats
// @Accept json
// @Produce json
// @Param seat_id path int true "Seat ID"
// @Success 200 {object} database.Seat
// @Router /api/v1/seats/seat_id/{seat_id} [get]
func GetSeatByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        seatIDStr := GetLastPath(r)
        seatID, err := strconv.Atoi(seatIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get seat: %v\n", err)
            return
        }

        seat, err := database.GetSeatByID(db, seatID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seat)
    }
}

// @Summary Get seat by number with flight and aircraft ID
// @Description Get seat by number with flight and aircraft ID
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Param seat_number path string true "Seat Number"
// @Success 200 {object} database.Seat
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id}/seat_number/{seat_number} [get]
func GetSeatByNumber(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 5]
        aircraftIDStr := splitStrings[len(splitStrings) - 3]
        seatNumber := splitStrings[len(splitStrings) - 1]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create seat: %v\n", err)
            return
        }

        seat, err := database.GetSeatByNumber(db, flightID, aircraftID, seatNumber)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seat)
    }
}

// @Summary Get all seats
// @Description Get all seats
// @Tags seats
// @Accept json
// @Produce json
// @Success 200 {array} database.Seat
// @Router /api/v1/seats [get]
func GetAllSeats(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        seats, err := database.GetAllSeats(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seats)
    }
}

// @Summary Update seat by ID
// @Description Update seat by ID
// @Tags seats
// @Accept json
// @Produce json
// @Param seat_id path int true "Seat ID"
// @Param status path string true "Seat Status"
// @Success 200 {string} string
// @Router /api/v1/seats/seat_id/{seat_id} [put]
func UpdateSeat(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        seatIDStr := GetLastPath(r)
        seatID, err := strconv.Atoi(seatIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update seat: %v\n", err)
            return
        }

        seat := database.Seat{}
        err = json.NewDecoder(r.Body).Decode(&seat)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update seat: %v\n", err)
            return
        }
        seat.SeatID = seatID

        err = database.UpdateSeat(db, seat)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seat)
    }
}

// @Summary Remove seat by ID
// @Description Remove seat by ID
// @Tags seats
// @Accept json
// @Produce json
// @Param seat_id path int true "Seat ID"
// @Success 200 {string} string
// @Router /api/v1/seats/seat_id/{seat_id} [delete]
func RemoveSeat(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        seatIDStr := GetLastPath(r)
        seatID, err := strconv.Atoi(seatIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove seat: %v\n", err)
            return
        }

        err = database.RemoveSeat(db, seatID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "delete successful"})
    }
}

// @Summary Remove all seats by flight and aircraft ID
// @Description Remove all seats by flight and aircraft ID
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Success 200 {string} string
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id} [delete]
func RemoveSeatsByFlightAndAircraftID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 3]
        aircraftIDStr := splitStrings[len(splitStrings) - 1]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove seat: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove seat: %v\n", err)
            return
        }

        err = database.RemoveSeatsByFlightAndAircraftID(db, flightID, aircraftID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "delete successful"})
    }
}

// @Summary Get available seats by flight and aircraft ID
// @Description Get available seats by flight and aircraft ID
// @Tags seats
// @Accept json
// @Produce json
// @Param flight_id path int true "Flight ID"
// @Param aircraft_id path int true "Aircraft ID"
// @Success 200 {array} database.Seat
// @Router /api/v1/seats/flight_id/{flight_id}/aircraft_id/{aircraft_id}/available [get]
func GetAvailableSeatsByFlightAndAircraftID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        splitStrings := strings.Split(r.URL.Path, "/")
        flightIDStr := splitStrings[len(splitStrings) - 4]
        aircraftIDStr := splitStrings[len(splitStrings) - 2]

        flightID, err := strconv.Atoi(flightIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get available seats: %v\n", err)
            return
        }
        aircraftID, err := strconv.Atoi(aircraftIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get available seats: %v\n", err)
            return
        }

        seats, err := database.GetAvailableSeats(db, flightID, aircraftID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            return
        }

        respondWithJSON(r, w, http.StatusOK, seats)
    }
}

// RegisterSeatsRoutes registers the routes for the seats API
func RegisterSeatsRoutes(db *sql.DB, mux *http.ServeMux) {
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, SeatRoute)),
        GetAllSeats(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}")),
        GetSeatsByFlightAndAircraftID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "seat_id", "{seat_id}")),
        GetSeatByID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}", "seat_number", "{seat_number}")),
        GetSeatByNumber(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}")),
        CreateSeatsByFlightAndAircraftIDArray(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}", "capacity", "{capacity}")),
        CreateSeatsByFlightAndAircraftIDCapacity(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "seat_id", "{seat_id}")),
        UpdateSeat(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "seat_id", "{seat_id}")),
        RemoveSeat(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}")),
        RemoveSeatsByFlightAndAircraftID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, SeatRoute, "flight_id", "{flight_id}", "aircraft_id", "{aircraft_id}", "available")),
        GetAvailableSeatsByFlightAndAircraftID(db),
    )
}