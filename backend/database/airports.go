package database

import (
	"database/sql"
	"encoding/csv"
	"log"
	"os"

	"github.com/lib/pq"
)

// Airport represents the structure of an airport
type Airport struct {
    AirportID int    `json:"airport_id"`
    Name      string `json:"name"`
    City      string `json:"city"`
    Country   string `json:"country"`
    IATA      string `json:"iata"`
    ICAO      string `json:"icao"`
    // Latitude  string
    // Longitude string
    // Altitude  string
    Timezone string `json:"timezone"`
    // DST       string
    // TZ        string
    // Type      string
    // Source    string
}

// CreateAirportsTable creates the 'airports' table
func CreateAirportsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS airports (
        airport_id SERIAL PRIMARY KEY,                -- Unique identifier for the airport
        name VARCHAR(100) NOT NULL,                    -- Name of the airport
        city VARCHAR(100) NOT NULL,                    -- City of the airport
        country VARCHAR(100) NOT NULL,                 -- Country of the airport
        iata VARCHAR(255) NOT NULL,                      -- IATA code of the airport
        icao VARCHAR(255) NOT NULL,                      -- ICAO code of the airport
        -- latitude VARCHAR(20) NOT NULL,                -- Latitude of the airport
        -- longitude VARCHAR(20) NOT NULL,               -- Longitude of the airport
        -- altitude VARCHAR(20) NOT NULL,                -- Altitude of the airport
        -- dst VARCHAR(1) NOT NULL,                      -- Daylight saving time of the airport
        -- tz VARCHAR(100) NOT NULL,                     -- Timezone of the airport
        -- type VARCHAR(100) NOT NULL,                   -- Type of the airport
        -- source VARCHAR(100) NOT NULL,                  -- Source of the airport
        timezone VARCHAR(255) NOT NULL                 -- Timezone of the airport
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'airports' table: %v", err)
        return err
    }

    return nil
}

// InsertAirport inserts a new airport into the 'airports' table
func InsertAirport(db *sql.DB, airport Airport) error {
    query := `
    INSERT INTO airports (name, city, country, iata, icao, timezone)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING airport_id`

    airportID := int(0)
    err := db.QueryRow(query, airport.Name, airport.City, airport.Country, airport.IATA, airport.ICAO, airport.Timezone).Scan(&airportID)
    if err != nil {
        log.Printf("Failed to insert airport: %v\n", err)
        return err
    }

    return nil
}

// ReadCSVAndInsertAirPorts reads the CSV file and inserts airport data into the table
func ReadCSVAndInsertAirPorts(db *sql.DB, filePath string) error {
    file, err := os.Open(filePath)
    if err != nil {
        log.Printf("Failed to open file: %v\n", err)
    }
    defer file.Close()

    reader := csv.NewReader(file)
    records, err := reader.ReadAll()
    if err != nil {
        log.Printf("Failed to read CSV file: %v\n", err)
        return err
    }

    for _, record := range records[1:] {
        airport := Airport{
            Name:     record[1],
            City:     record[2],
            Country:  record[3],
            IATA:     record[4],
            ICAO:     record[5],
            Timezone: record[11],
        }
        InsertAirport(db, airport)
    }

    return nil
}

func BulkInsertAirports(db *sql.DB, filePath string) error {
    // Open the CSV file
    file, err := os.Open(filePath)
    if err != nil {
        log.Printf("failed to open CSV file: %v\n", err)
        return err
    }
    defer file.Close()

    // Read the CSV records
    reader := csv.NewReader(file)
    records, err := reader.ReadAll()
    if err != nil {
        log.Printf("failed to read CSV file: %v\n", err)
        return err
    }

    tx, err := db.Begin()
    if err != nil {
        log.Printf("failed to begin transaction: %v\n", err)
        return err
    }

    // Prepare the SQL statement
    stmt, err := tx.Prepare(pq.CopyIn("airports", "name", "city", "country", "iata", "icao", "timezone"))
    if err != nil {
        log.Printf("failed to prepare statement: %v\n", err)
        return err
    }

    for _, record := range records[1:] {
        // Insert the record into the 'airports' table
        _, err = stmt.Exec(record[1], record[2], record[3], record[4], record[5], record[11])
        if err != nil {
            log.Printf("failed to insert record: %v\n", err)
            return err
        }
    }

    // Execute the prepared statement
    _, err = stmt.Exec()
    if err != nil {
        log.Printf("failed to execute statement: %v\n", err)
        return err
    }

    // Close the prepared statement
    err = stmt.Close()
    if err != nil {
        log.Printf("failed to close statement: %v\n", err)
        return err
    }

    // Commit the transaction
    err = tx.Commit()
    if err != nil {
        log.Printf("failed to commit transaction: %v\n", err)
        return err
    }

    return nil
}

// Get the list of airports
func GetAllAirports(db *sql.DB) ([]Airport, error) {
    query := `SELECT airport_id, name, city, country, iata, icao, timezone FROM airports`
    rows, err := db.Query(query)
    if err != nil {
        log.Printf("Failed to get airports: %v\n", err)
        return nil, err
    }
    defer rows.Close()

    airports := []Airport{}
    for rows.Next() {
        var airport Airport
        if err := rows.Scan(&airport.AirportID, &airport.Name, &airport.City, &airport.Country, &airport.IATA, &airport.ICAO, &airport.Timezone); err != nil {
            log.Printf("Failed to scan airports: %v\n", err)
            return nil, err
        }
        airports = append(airports, airport)
    }

    return airports, nil
}

// GetAirportByIATA returns an airport by its IATA code
func GetAirportByIATA(db *sql.DB, iata string) (Airport, error) {
    query := `SELECT airport_id, name, city, country, iata, icao, timezone FROM airports WHERE iata = $1`
    row := db.QueryRow(query, iata)

    airport := Airport{}
    if err := row.Scan(
        &airport.AirportID,
        &airport.Name,
        &airport.City,
        &airport.Country,
        &airport.IATA,
        &airport.ICAO,
        &airport.Timezone,
    ); err != nil {
        log.Printf("Failed to get airport by IATA code: %v\n", err)
        return Airport{}, err
    }

    return airport, nil
}

// GetAirportByICAO returns an airport by its ICAO code
func GetAirportByICAO(db *sql.DB, icao string) (Airport, error) {
    query := `SELECT airport_id, name, city, country, iata, icao, timezone FROM airports WHERE icao = $1`
    row := db.QueryRow(query, icao)

    airport := Airport{}
    if err := row.Scan(
        &airport.AirportID,
        &airport.Name,
        &airport.City,
        &airport.Country,
        &airport.IATA,
        &airport.ICAO,
        &airport.Timezone,
    ); err != nil {
        log.Printf("Failed to get airport by ICAO code: %v\n", err)
        return Airport{}, err
    }

    return airport, nil
}

// GetAirportByCity returns an airport by its city
func GetAirportByCity(db *sql.DB, city string) ([]Airport, error) {
    query := `SELECT airport_id, name, city, country, iata, icao, timezone FROM airports WHERE city = $1`
    rows, err := db.Query(query, city)
    if err != nil {
        log.Printf("Failed to get airport by city: %v\n", err)
        return nil, err
    }

    airports := []Airport{}
    for rows.Next() {
        var airport Airport
        if err := rows.Scan(&airport.AirportID, &airport.Name, &airport.City, &airport.Country, &airport.IATA, &airport.ICAO, &airport.Timezone); err != nil {
            log.Printf("Failed to scan airports: %v\n", err)
            return nil, err
        }
        airports = append(airports, airport)
    }

    return airports, nil
}

// GetAirportByID returns an airport by its ID
func GetAirportByID(db *sql.DB, id int) (Airport, error) {
    query := `SELECT airport_id, name, city, country, iata, icao, timezone FROM airports WHERE airport_id = $1`
    row := db.QueryRow(query, id)

    airport := Airport{}
    if err := row.Scan(
        &airport.AirportID,
        &airport.Name,
        &airport.City,
        &airport.Country,
        &airport.IATA,
        &airport.ICAO,
        &airport.Timezone,
    ); err != nil {
        log.Printf("Failed to get airport by ID: %v\n", err)
        return Airport{}, err
    }

    return airport, nil
}
