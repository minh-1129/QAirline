package database

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

// Plane struct for the planes table
type Plane struct {
	AircraftID   int `json:"aircraft_id"`
	AircraftType string `json:"aircraft_type"`
	Capacity     int `json:"capacity"`
}

// CreatePlanesTable creates the 'planes' table
func CreatePlanesTable(db *sql.DB) error {
	createTableQuery := `
    CREATE TABLE IF NOT EXISTS planes (
        aircraft_id SERIAL PRIMARY KEY,
        aircraft_type VARCHAR(100) NOT NULL UNIQUE,
        capacity INT NOT NULL
    )
    `
	_, err := db.Exec(createTableQuery)
	if err != nil {
		log.Fatalf("Failed to create 'planes' table: %v", err)
	}

	return nil
}

// GetPlaneByID retrieves a plane by its ID
func GetPlaneByID(db *sql.DB, planeID int) (*Plane, error) {
	query := `SELECT aircraft_id, aircraft_type, capacity
              FROM planes WHERE id = $1`

	var plane Plane
	err := db.QueryRow(query, planeID).Scan(&plane.AircraftID, &plane.AircraftType, &plane.Capacity)
	if err != nil {
		return nil, fmt.Errorf("could not get plane: %v", err)
	}

	return &plane, nil
}

// GetPlaneByAircraftType retrieves a plane by its aircraft type
func GetPlaneByAircraftType(db *sql.DB, aircraftType string) (*Plane, error) {
	query := `SELECT aircraft_id, aircraft_type, capacity
              FROM planes WHERE aircraft_type = $1`

	var plane Plane
	err := db.QueryRow(query, aircraftType).Scan(&plane.AircraftID, &plane.AircraftType, &plane.Capacity)
	if err != nil {
		return nil, fmt.Errorf("could not get plane: %v", err)
	}

	return &plane, nil
}

// InsertPlane inserts a new plane into the planes table
func InsertPlane(db *sql.DB, plane *Plane) (int, error) {
	query := `
    INSERT INTO planes (aircraft_type, capacity)
    VALUES ($1, $2)
    RETURNING aircraft_id`

	var aircraftID int
	err := db.QueryRow(query, plane.AircraftType, plane.Capacity).Scan(&aircraftID)
	if err != nil {
		return 0, fmt.Errorf("could not insert plane: %v", err)
	}

	return aircraftID, nil
}

// UpdatePlane updates an existing plane's details
func UpdatePlane(db *sql.DB, plane *Plane) error {
	query := `UPDATE planes SET aircraft_type = $1, capacity = $2 WHERE aircraft_id = $3`

	_, err := db.Exec(query, plane.AircraftType, plane.Capacity, plane.AircraftID)
	if err != nil {
		log.Fatalf("could not update plane: %v", err)
	}

	return nil
}

// RemovePlane removes a plane by its ID
func RemovePlane(db *sql.DB, planeID int) error {
	query := `DELETE FROM planes WHERE aircraft_id = $1`

	_, err := db.Exec(query, planeID)
	if err != nil {
		log.Fatalf("could not remove plane: %v", err)
	}

	return nil
}

// GetAllPlanes retrieves all planes from the 'planes' table
func GetAllPlanes(db *sql.DB) ([]Plane, error) {
	query := `SELECT aircraft_id, aircraft_type, capacity FROM planes`

	rows, err := db.Query(query)
	if err != nil {
		return nil, fmt.Errorf("error fetching planes: %v", err)
	}
	defer rows.Close()

	var planes []Plane
	for rows.Next() {
		var plane Plane
		if err := rows.Scan(&plane.AircraftID, &plane.AircraftType, &plane.Capacity); err != nil {
			return nil, fmt.Errorf("error scanning row: %v", err)
		}
		planes = append(planes, plane)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("error iterating rows: %v", err)
	}

	return planes, nil
}

// GetPlanesByAircraftType retrieves all planes of a specific aircraft type
func GetPlanesByAircraftType(db *sql.DB, aircraftType string) ([]Plane, error) {
	query := `SELECT aircraft_id, aircraft_type, capacity
              FROM planes WHERE aircraft_type = $1`

	rows, err := db.Query(query, aircraftType)
	if err != nil {
		return nil, fmt.Errorf("error fetching planes: %v", err)
	}
	defer rows.Close()

	var planes []Plane
	for rows.Next() {
		var plane Plane
		if err := rows.Scan(&plane.AircraftID, &plane.AircraftType, &plane.Capacity); err != nil {
			return nil, fmt.Errorf("error scanning row: %v", err)
		}
		planes = append(planes, plane)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("error iterating rows: %v", err)
	}

	return planes, nil
}
