package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"strings"

	"net/http"
	"strconv"
	"webserver/database"
)

// @Summary Create an aircraft
// @Description Create an aircraft
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft body database.Aircraft true "Aircraft object"
// @Success 200 {object} database.Aircraft
// @Router /api/v1/aircrafts [post]
// CreateAircraft creates a new aircraft
func CreateAircraft(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var aircraft database.Aircraft
        err := json.NewDecoder(r.Body).Decode(&aircraft)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create aircraft: %v\n", err)
            return
        }

        aircraftID, err := database.InsertAircraft(db, &aircraft)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to create aircraft: %v\n", err)
            return
        }

        aircraft.AircraftID = aircraftID
        respondWithJSON(r, w, http.StatusCreated, aircraft)
    }
}

// @Summary Get aircraft by ID
// @Description Get aircraft by ID
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_id path int true "Aircraft ID"
// @Success 200 {object} database.Aircraft
// @Router /api/v1/aircrafts/{aircraft_id} [get]
// Get aircraft by ID
func GetAircraftByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftIDStr := GetLastPath(r)
        aircraftID, err := strconv.Atoi(aircraftIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircraft: %v\n", err)
            return
        }

        aircraft, err := database.GetAircraftByID(db, aircraftID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircraft: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircraft)
    }
}

// @Summary Get aircrafts by aircraft type
// @Description Get aircrafts by aircraft type
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_type path string true "Aircraft Type"
// @Success 200 {object} []database.Aircraft
// @Router /api/v1/aircrafts/search/aircraft/{aircraft_type} [get]
// Get aircraft by aircraft type
func GetAircraftsByAircraftType(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftType := GetLastPath(r)

        if strings.TrimSpace(aircraftType) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid aircraft type"})
            return
        }

        aircraft, err := database.GetAircraftsByAircraftType(db, aircraftType)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircraft: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircraft)
    }
}

// @Summary Update aircraft by ID
// @Description Update aircraft by ID
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_id path int true "Aircraft ID"
// @Param aircraft body database.Aircraft true "Aircraft object"
// @Success 200 {object} database.Aircraft
// @Router /api/v1/aircrafts/{aircraft_id} [put]
// UpdateAircraft updates an aircraft by its ID
func UpdateAircraft(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftIDStr := GetLastPath(r)
        aircraftID, err := strconv.Atoi(aircraftIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid aircraft ID"})
            log.Printf("Failed to update aircraft: %v\n", err)
            return
        }

        var aircraft database.Aircraft
        err = json.NewDecoder(r.Body).Decode(&aircraft)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update aircraft: %v\n", err)
            return
        }

        aircraft.AircraftID = aircraftID
        err = database.UpdateAircraft(db, &aircraft)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update aircraft: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircraft)
    }
}

// @Summary Remove aircraft by ID
// @Description Remove aircraft by ID
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_id path int true "Aircraft ID"
// @Success 200 {object} map[string]string
// @Router /api/v1/aircrafts/{aircraft_id} [delete]
// DeleteAircraft deletes an aircraft by its ID
func RemoveAircraft(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftIDStr := GetLastPath(r)
        aircraftID, err := strconv.Atoi(aircraftIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete aircraft: %v\n", err)
            return
        }

        err = database.RemoveAircraft(db, aircraftID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete aircraft: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "Aircraft deleted successfully"})
    }
}

// @Summary Get all aircrafts
// @Description Get all aircrafts
// @Tags aircrafts
// @Accept json
// @Produce json
// @Success 200 {object} []database.Aircraft
// @Router /api/v1/aircrafts [get]
// GetAllAircrafts retrieves all aircrafts
func GetAllAircrafts(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircrafts, err := database.GetAllAircrafts(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircrafts: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircrafts)
    }
}

// @Summary Get all aircrafts by aircraft manufacturer
// @Description Get all aircrafts by aircraft manufacturer
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_manufacturer path string true "Aircraft Manufacturer"
// @Success 200 {object} []database.Aircraft
// @Router /api/v1/aircrafts/search/manufacturer/{aircraft_manufacturer} [get]
// GetAircraftsByAircraftManufacturer retrieves all aircrafts by aircraft manufacturer
func GetAircraftsByAircraftManufacturer(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftManufacturer := GetLastPath(r)

        if strings.TrimSpace(aircraftManufacturer) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid aircraft manufacturer"})
            return
        }

        aircrafts, err := database.GetAircraftsByAircraftManufacturer(db, aircraftManufacturer)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircrafts: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircrafts)
    }
}

// @Summary Get all aircrafts by capacity threshold (>= capacity)
// @Description Get all aircrafts by capacity threshold (>= capacity)
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param capacity path int true "Aircraft Capacity"
// @Success 200 {object} []database.Aircraft
// @Router /api/v1/aircrafts/search/capacity/{capacity} [get]
// GetAircraftsByCapacity retrieves all aircrafts by capacity
func GetAircraftsByCapacity(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        capacityStr := GetLastPath(r)
        capacity, err := strconv.Atoi(capacityStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid aircraft capacity"})
            return
        }

        aircrafts, err := database.GetAircraftsByCapacity(db, capacity)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircrafts: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircrafts)
    }
}

// @Summary Get all aircrafts by aircraft name
// @Description Get all aircrafts by aircraft name
// @Tags aircrafts
// @Accept json
// @Produce json
// @Param aircraft_name path string true "Aircraft Name"
// @Success 200 {object} []database.Aircraft
// @Router /api/v1/aircrafts/search/name/{aircraft_name} [get]
// GetAircraftsByAircraftName retrieves all aircrafts by aircraft name
func GetAircraftsByAircraftName(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        aircraftName := GetLastPath(r)

        if strings.TrimSpace(aircraftName) == "" {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": "Invalid aircraft name"})
            return
        }

        aircrafts, err := database.GetAircraftsByAircraftName(db, aircraftName)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get aircrafts: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, aircrafts)
    }
}

// RegisterAircraftsRoutes registers all routes related to aircrafts
func RegisterAircraftsRoutes(db *sql.DB, mux *http.ServeMux) {
    //Register the API routes
    mux.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, AircraftRoute)),
        CreateAircraft(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute)),
        GetAllAircrafts(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "{aircraft_id}")),
        GetAircraftByID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "{aircraft_id}")),
        UpdateAircraft(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "{aircraft_id}")),
        RemoveAircraft(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "search/aircraft", "{aircraft_type}")),
        GetAircraftsByAircraftType(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "search/manufacturer", "{aircraft_manufacturer}")),
        GetAircraftsByAircraftManufacturer(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "search/capacity", "{capacity}")),
        GetAircraftsByCapacity(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AircraftRoute, "search/name", "{aircraft_name}")),
        GetAircraftsByAircraftName(db),
    )
}