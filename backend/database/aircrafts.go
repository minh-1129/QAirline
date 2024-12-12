package database

import (
	"database/sql"
	// "encoding/csv"
	"fmt"
	"log"

	// "os"

	_ "github.com/lib/pq"
)

// Aircraft struct for the aircrafts table
type Aircraft struct {
    AircraftID   int `json:"aircraft_id"`
    AircraftManufacturer string `json:"aircraft_manufacturer"`
    AircraftType string `json:"aircraft_type"`
    AircraftName string `json:"aircraft_name"`
    Capacity     int `json:"capacity"`
}

// CreateAircraftsTable creates the 'aircrafts' table
func CreateAircraftsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS aircrafts (
        aircraft_id SERIAL PRIMARY KEY,
        aircraft_manufacturer VARCHAR(255) NOT NULL,
        aircraft_type VARCHAR(255) NOT NULL,
        aircraft_name VARCHAR(255) NOT NULL,
        capacity INT NOT NULL
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'aircrafts' table: %v\n", err)
        return err
    }

    return nil
}

// GetAircraftByID retrieves an aircraft by its ID
func GetAircraftByID(db *sql.DB, aircraftID int) (*Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity
              FROM aircrafts WHERE aircraft_id = $1`

    aircraft := Aircraft{}
    err := db.QueryRow(query, aircraftID).Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity)
    if err != nil {
        return nil, fmt.Errorf("could not get aircraft: %v", err)
    }

    return &aircraft, nil
}

// InsertAircraft inserts a new aircraft into the aircrafts table
func InsertAircraft(db *sql.DB, aircraft *Aircraft) (int, error) {
    query := `
    INSERT INTO aircrafts (aircraft_manufacturer, aircraft_type, aircraft_name, capacity)
    VALUES ($1, $2, $3, $4)
    RETURNING aircraft_id`

    aircraftID := int(0)
    err := db.QueryRow(query, aircraft.AircraftManufacturer, aircraft.AircraftType, aircraft.AircraftName, aircraft.Capacity).Scan(&aircraftID)
    if err != nil {
        return 0, fmt.Errorf("could not insert aircraft: %v", err)
    }

    return aircraftID, nil
}

// UpdateAircraft updates an existing aircraft's details
func UpdateAircraft(db *sql.DB, aircraft *Aircraft) error {
    query := `UPDATE aircrafts SET aircraft_manufacturer = $1, aircraft_type = $2, aircraft_name = $3, capacity = $4 WHERE aircraft_id = $5`

    _, err := db.Exec(query, aircraft.AircraftManufacturer, aircraft.AircraftType, aircraft.AircraftName, aircraft.Capacity, aircraft.AircraftID)
    if err != nil {
        log.Printf("could not update aircraft: %v\n", err)
        return err
    }

    return nil
}

// RemoveAircraft removes an aircraft by its ID
func RemoveAircraft(db *sql.DB, aircraftID int) error {
    query := `DELETE FROM aircrafts WHERE aircraft_id = $1`

    _, err := db.Exec(query, aircraftID)
    if err != nil {
        log.Printf("could not remove aircraft: %v\n", err)
        return err
    }

    return nil
}

// GetAllAircrafts retrieves all aircrafts from the 'aircrafts' table
func GetAllAircrafts(db *sql.DB) ([]Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity FROM aircrafts`

    rows, err := db.Query(query)
    if err != nil {
        return nil, fmt.Errorf("error fetching aircrafts: %v", err)
    }
    defer rows.Close()

    aircrafts := []Aircraft{}
    for rows.Next() {
        var aircraft Aircraft
        if err := rows.Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        aircrafts = append(aircrafts, aircraft)
    }

    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return aircrafts, nil
}

// GetAircraftsByAircraftType retrieves all aircrafts of a specific aircraft type
func GetAircraftsByAircraftType(db *sql.DB, aircraftType string) ([]Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity
              FROM aircrafts WHERE aircraft_type = $1`

    rows, err := db.Query(query, aircraftType)
    if err != nil {
        return nil, fmt.Errorf("error fetching aircrafts: %v", err)
    }
    defer rows.Close()

    aircrafts := []Aircraft{}
    for rows.Next() {
        var aircraft Aircraft
        if err := rows.Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        aircrafts = append(aircrafts, aircraft)
    }

    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return aircrafts, nil
}

// GetAircraftsByAircraftManufacturer retrieves all aircrafts of a specific aircraft manufacturer
func GetAircraftsByAircraftManufacturer(db *sql.DB, aircraftManufacturer string) ([]Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity
              FROM aircrafts WHERE aircraft_manufacturer = $1`

    rows, err := db.Query(query, aircraftManufacturer)
    if err != nil {
        return nil, fmt.Errorf("error fetching aircrafts: %v", err)
    }
    defer rows.Close()

    aircrafts := []Aircraft{}
    for rows.Next() {
        var aircraft Aircraft
        if err := rows.Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        aircrafts = append(aircrafts, aircraft)
    }

    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return aircrafts, nil
}

// GetAircraftsByCapacity retrieves all aircrafts with a specific capacity
func GetAircraftsByCapacity(db *sql.DB, capacity int) ([]Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity
              FROM aircrafts WHERE capacity >= $1`

    rows, err := db.Query(query, capacity)
    if err != nil {
        return nil, fmt.Errorf("error fetching aircrafts: %v", err)
    }
    defer rows.Close()

    aircrafts := []Aircraft{}
    for rows.Next() {
        var aircraft Aircraft
        if err := rows.Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        aircrafts = append(aircrafts, aircraft)
    }

    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return aircrafts, nil
}

// GetAircraftsByAircraftName retrieves all aircrafts with a specific name
func GetAircraftsByAircraftName(db *sql.DB, aircraftName string) ([]Aircraft, error) {
    query := `SELECT aircraft_id, aircraft_manufacturer, aircraft_type, aircraft_name, capacity
              FROM aircrafts WHERE aircraft_name = $1`

    rows, err := db.Query(query, aircraftName)
    if err != nil {
        return nil, fmt.Errorf("error fetching aircrafts: %v", err)
    }
    defer rows.Close()

    aircrafts := []Aircraft{}
    for rows.Next() {
        var aircraft Aircraft
        if err := rows.Scan(&aircraft.AircraftID, &aircraft.AircraftManufacturer, &aircraft.AircraftType, &aircraft.AircraftName, &aircraft.Capacity); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        aircrafts = append(aircrafts, aircraft)
    }

    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return aircrafts, nil
}

// // BulkInsertAircrafts inserts multiple aircrafts into the aircrafts table
// func BulkInsertAircrafts(db *sql.DB, filePath string) error {
//     // Open the csv file
//     file, err := os.Open(filePath)
//     if err != nil {
//         return fmt.Errorf("could not open file: %v", err)
//     }
//     defer file.Close()

//     // Read the csv file
//     reader := csv.NewReader(file)
//     record, err := reader.ReadAll()
//     if err != nil {
//         return fmt.Errorf("could not read file: %v", err)
//     }


// }