package api

import (
	"database/sql"
	"fmt"
	"log"

	// "fmt"
	"net/http"
	"strconv"
	"webserver/database"
)

// @Summary Get all airports
// @Description Get all airports
// @Tags airports
// @Accept json
// @Produce json
// @Success 200 {object} []database.Airport
// @Router /api/v1/airports [get]
// Get all airports
func getAllAirports(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        airports, err := database.GetAllAirports(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, airports)
    }
}

// @Summary Get airport by IATA code
// @Description Get airport by IATA code
// @Tags airports
// @Accept json
// @Produce json
// @Param iata path string true "IATA code"
// @Success 200 {object} database.Airport
// @Router /api/v1/airports/iata/{iata} [get]
// Get airport by IATA code
func getAirportByIATA(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        iata := GetLastPath(r)

        airport, err := database.GetAirportByIATA(db, iata)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, airport)
    }
}

// @Summary Get airport by ICAO code
// @Description Get airport by ICAO code
// @Tags airports
// @Accept json
// @Produce json
// @Param icao path string true "ICAO code"
// @Success 200 {object} database.Airport
// @Router /api/v1/airports/icao/{icao} [get]
// Get airport by ICAO code
func getAirportByICAO(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        icao := GetLastPath(r)

        airport, err := database.GetAirportByICAO(db, icao)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, airport)
    }
}

// @Summary Get airport by city
// @Description Get airport by city
// @Tags airports
// @Accept json
// @Produce json
// @Param city path string true "City"
// @Success 200 {object} []database.Airport
// @Router /api/v1/airports/city/{city} [get]
// Get airport by city
func getAirportByCity(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        city := GetLastPath(r)

        airports, err := database.GetAirportByCity(db, city)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, airports)
    }
}

// @Summary Get airport by ID
// @Description Get airport by ID
// @Tags airports
// @Accept json
// @Produce json
// @Param airport_id path int true "Airport ID"
// @Success 200 {object} database.Airport
// @Router /api/v1/airports/id/{airport_id} [get]
// Get airport by ID
func getAirportByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        airportIDStr := GetLastPath(r)
        airportId, err := strconv.Atoi(airportIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        airport, err := database.GetAirportByID(db, airportId)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get airports: %v", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, airport)
    }
}

// RegisterAirportsRoutes initializes all airports routes
func RegisterAirportsRoutes(db *sql.DB) {
    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AirportRoute)),
        getAllAirports(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AirportRoute, "iata", "{iata}")),
        getAirportByIATA(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AirportRoute, "id", "{airport_id}")),
        getAirportByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AirportRoute, "icao", "{icao}")),
        getAirportByICAO(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, AirportRoute, "city", "{city}")),
        getAirportByCity(db),
    )
}