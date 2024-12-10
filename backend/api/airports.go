package api

import (
    "database/sql"
    "fmt"
    "strings"

    // "fmt"
    "net/http"
    "net/url"
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
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get airports"})
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
        vars := strings.Split(r.URL.Path, "/")
        iata := vars[len(vars)-1]

        airport, err := database.GetAirportByIATA(db, iata)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get airport by IATA code"})
            return
        }

        respondWithJSON(r, w, http.StatusOK, airport)
    }
}

// @Summary Get airport by ID
// @Description Get airport by ID
// @Tags airports
// @Accept json
// @Produce json
// @Param id path int true "Airport ID"
// @Success 200 {object} database.Airport
// @Router /api/v1/airports/id/{id} [get]
// Get airport by ID
func getAirportByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        vars := strings.Split(r.URL.Path, "/")
        id, _ := strconv.Atoi(vars[len(vars)-1])

        airport, err := database.GetAirportByID(db, id)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"message": "Failed to get airport by ID"})
            return
        }

        respondWithJSON(r, w, http.StatusOK, airport)
    }
}

// RegisterAirportsRoutes initializes all airports routes
func RegisterAirportsRoutes(db *sql.DB) {
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", API_HOST, API_PORT),
    }

    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET /%s", url.JoinPath(API_BASE_URL, AirportRoute).Path),
        getAllAirports(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", url.JoinPath(API_BASE_URL, AirportRoute, "iata", "{iata}").Path),
        getAirportByIATA(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", url.JoinPath(API_BASE_URL, AirportRoute, "id", "{id}").Path),
        getAirportByID(db),
    )
}