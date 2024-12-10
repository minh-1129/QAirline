package database

import (
    "database/sql"
    "log"
    "time"

    _ "github.com/lib/pq"
)

// Flight struct for flights table
type Flight struct {
    FlightID         int       `json:"flight_id"`
    FlightNumber     string    `json:"flight_number"`
    AircraftID       int       `json:"aircraft_id"`
    DepartureAirport string    `json:"departure_airport"`
    ArrivalAirport   string    `json:"arrival_airport"`
    DepartureTime    time.Time `json:"departure_time"`
    ArrivalTime      time.Time `json:"arrival_time"`
    Status           string    `json:"status"`
    Gate             string    `json:"gate"`
    BoardTime        time.Time `json:"board_time"`
}

type FlightsResponse struct {
    DepartingFlights []Flight `json:"departing_flights"`
    ReturnFlights    []Flight `json:"return_flights"`
}

const TIME_LAYOUT = time.RFC3339

// CreateFlightsTable creates the 'flights' table
func CreateFlightsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS flights (
        flight_id SERIAL PRIMARY KEY,
        flight_number VARCHAR(20) NOT NULL,
        aircraft_id INT NOT NULL,
        departure_airport VARCHAR(3) NOT NULL,
        arrival_airport VARCHAR(3) NOT NULL,
        departure_time TIMESTAMPTZ NOT NULL,
        arrival_time TIMESTAMPTZ NOT NULL,
        status VARCHAR(20) NOT NULL,
        gate VARCHAR(10),
        board_time TIMESTAMPTZ
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Fatalf("Failed to create 'flights' table: %v", err)
    }

    return nil
}

// SetFlightsForeignKeys sets foreign key constraints for the 'flights' table
func SetFlightsForeignKeys(db *sql.DB) error {
    query := `
    ALTER TABLE flights
    ADD CONSTRAINT fk_flight_plane
    FOREIGN KEY (aircraft_id) REFERENCES planes(aircraft_id) ON DELETE SET NULL;
    `

    _, err := db.Exec(query)
    if err != nil {
        log.Fatalf("Failed to set foreign key constraint for 'flights' table: %v", err)
    }

    return nil
}

// GetFlightByID retrieves a flight by its ID
func GetFlightByID(db *sql.DB, flightID int) (*Flight, error) {
    query := `
    SELECT
        flight_id,
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    FROM flights WHERE flight_id = $1
    `

    row := db.QueryRow(query, flightID)
    flight := &Flight{}

    err := row.Scan(
        &flight.FlightID,
        &flight.FlightNumber,
        &flight.AircraftID,
        &flight.DepartureAirport,
        &flight.ArrivalAirport,
        &flight.DepartureTime,
        &flight.ArrivalTime,
        &flight.Status,
        &flight.Gate,
        &flight.BoardTime,
    )
    if err != nil {
        if err == sql.ErrNoRows {
            return nil, nil
        }

        log.Fatalf("could not scan flight: %v", err)
    }

    return flight, nil
}

// GetFlightByFlightNumber retrieves a flight by its flight number
func GetFlightByFlightNumber(db *sql.DB, flightNumber string) ([]Flight, error) {
    query := `
    SELECT
        flight_id,
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    FROM flights WHERE flight_number = $1
    `

    row, err := db.Query(query, flightNumber)
    if err != nil {
        log.Fatalf("could not query flight: %v", err)
    }
    defer row.Close()

    flights := []Flight{}
    for row.Next() {
        flight := Flight{}
        err := row.Scan(
            &flight.FlightID,
            &flight.FlightNumber,
            &flight.AircraftID,
            &flight.DepartureAirport,
            &flight.ArrivalAirport,
            &flight.DepartureTime,
            &flight.ArrivalTime,
            &flight.Status,
            &flight.Gate,
            &flight.BoardTime,
        )
        if err != nil {
            log.Fatalf("could not scan flight: %v", err)
        }

        flights = append(flights, flight)
    }

    return flights, nil
}

// InsertFlight inserts a new flight into the flights table
func InsertFlight(db *sql.DB, flight *Flight) (int, error) {
    query := `
    INSERT INTO flights (
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING flight_id
    `

    var flightID int
    err := db.QueryRow(
        query,
        flight.FlightNumber,
        flight.AircraftID,
        flight.DepartureAirport,
        flight.ArrivalAirport,
        flight.DepartureTime,
        flight.ArrivalTime,
        flight.Status,
        flight.Gate,
        flight.BoardTime,
    ).Scan(&flightID)
    if err != nil {
        log.Fatalf("could not insert flight: %v", err)
    }

    return flightID, nil
}

// UpdateFlight updates an existing flight's details
func UpdateFlight(db *sql.DB, flight *Flight) error {
    query := `
    UPDATE flights SET
        flight_number = $1,
        aircraft_id = $2,
        departure_airport = $3,
        arrival_airport = $4,
        departure_time = $5,
        arrival_time = $6,
        status = $7,
        gate = $8,
        board_time = $9
    WHERE flight_id = $10
    `

    _, err := db.Exec(
        query,
        flight.FlightNumber,
        flight.AircraftID,
        flight.DepartureAirport,
        flight.ArrivalAirport,
        flight.DepartureTime,
        flight.ArrivalTime,
        flight.Status,
        flight.Gate,
        flight.BoardTime,
        flight.FlightID,
    )
    if err != nil {
        log.Fatalf("could not update flight: %v", err)
    }

    return nil
}

// RemoveFlight removes a flight by its ID
func RemoveFlight(db *sql.DB, flightID int) error {
    query := `DELETE FROM flights WHERE flight_id = $1`

    _, err := db.Exec(query, flightID)
    if err != nil {
        log.Fatalf("could not remove flight: %v", err)
    }

    return nil
}

// GetAllFlights retrieves all flights from the 'flights' table
func GetAllFlights(db *sql.DB) ([]Flight, error) {
    query := `
    SELECT
        flight_id,
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    FROM flights
    `

    rows, err := db.Query(query)
    if err != nil {
        log.Fatalf("could not query flights: %v", err)
    }
    defer rows.Close()

    flights := []Flight{}
    for rows.Next() {
        flight := Flight{}
        err := rows.Scan(
            &flight.FlightID,
            &flight.FlightNumber,
            &flight.AircraftID,
            &flight.DepartureAirport,
            &flight.ArrivalAirport,
            &flight.DepartureTime,
            &flight.ArrivalTime,
            &flight.Status,
            &flight.Gate,
            &flight.BoardTime,
        )
        if err != nil {
            log.Fatalf("could not scan flight: %v", err)
        }

        flights = append(flights, flight)
    }

    return flights, nil
}

// GetFlightsByDeAndArrAirport retrieves all flights from the 'flights' table by departure and arrival airport
func GetFlightsByDeAndArrAirport(db *sql.DB, departureAirport string, arrivalAirport string) ([]Flight, error) {
    query := `
    SELECT
        flight_id,
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    FROM flights WHERE departure_airport = $1 AND arrival_airport = $2
    `

    rows, err := db.Query(query, departureAirport, arrivalAirport)
    if err != nil {
        log.Fatalf("could not query flights: %v", err)
    }
    defer rows.Close()

    flights := []Flight{}
    for rows.Next() {
        flight := Flight{}
        err := rows.Scan(
            &flight.FlightID,
            &flight.FlightNumber,
            &flight.AircraftID,
            &flight.DepartureAirport,
            &flight.ArrivalAirport,
            &flight.DepartureTime,
            &flight.ArrivalTime,
            &flight.Status,
            &flight.Gate,
            &flight.BoardTime,
        )
        if err != nil {
            log.Fatalf("could not scan flight: %v", err)
        }

        flights = append(flights, flight)
    }

    return flights, nil
}

// GetFlightsByDeAndArrAirportAndTime retrieves all flights from the 'flights' table by departure and arrival airport and time
func GetFlightsByDeAndArrAirportAndDepTime(db *sql.DB, departureAirport string, arrivalAirport string, departureTime time.Time) ([]Flight, error) {
    query := `
    SELECT
        flight_id,
        flight_number,
        aircraft_id,
        departure_airport,
        arrival_airport,
        departure_time,
        arrival_time,
        status,
        gate,
        board_time
    FROM flights WHERE departure_airport = $1 AND arrival_airport = $2 AND DATE(departure_time) = DATE($3)
    `

    rows, err := db.Query(query, departureAirport, arrivalAirport, departureTime)
    if err != nil {
        log.Fatalf("could not query flights: %v", err)
    }
    defer rows.Close()

    flights := []Flight{}
    for rows.Next() {
        flight := Flight{}
        err := rows.Scan(
            &flight.FlightID,
            &flight.FlightNumber,
            &flight.AircraftID,
            &flight.DepartureAirport,
            &flight.ArrivalAirport,
            &flight.DepartureTime,
            &flight.ArrivalTime,
            &flight.Status,
            &flight.Gate,
            &flight.BoardTime,
        )
        if err != nil {
            log.Fatalf("could not scan flight: %v", err)
        }

        flights = append(flights, flight)
    }

    return flights, nil
}

// GetRoundTripFlightsByDeAndArrAirportAndTime retrieves all return flights from the 'flights' table by departure and arrival airport and time
func GetRoundTripFlightsByDeAndArrAirportAndTime(db *sql.DB, departureAirport string, arrivalAirport string, departureTime time.Time, returnTime time.Time) ([]Flight, []Flight, error) {
    // Get 2 lists of flights, use the above function, 1 depart and 1 return

    // Departure flights
    departureFlights, err := GetFlightsByDeAndArrAirportAndDepTime(db, departureAirport, arrivalAirport, departureTime)
    if err != nil {
        log.Fatalf("could not query departure flights: %v", err)
    }

    // Return flights
    returnFlights, err := GetFlightsByDeAndArrAirportAndDepTime(db, arrivalAirport, departureAirport, returnTime)
    if err != nil {
        log.Fatalf("could not query return flights: %v", err)
    }

    return departureFlights, returnFlights, nil
}