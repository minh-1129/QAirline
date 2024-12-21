package database

import (
    "database/sql"
    "fmt"
    "log"
    // "time"

    _ "github.com/lib/pq"
)

// Booking struct for bookings table
type Seat struct {
    SeatID        int       `json:"seat_id"`
    AircraftID    int       `json:"aircraft_id"`
    FlightID      int       `json:"flight_id"`
    SeatNumber    string    `json:"seat_number"`
    SeatType      string    `json:"seat_type"`
    SeatPrice     float64   `json:"seat_price"`
    SeatStatus    string    `json:"seat_status"`
}

const SeatPerRow = 4

// CreateSeatsTable creates the 'seats' table
func CreateSeatsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS seats (
        seat_id SERIAL PRIMARY KEY,               -- Unique identifier for the seat
        aircraft_id INT NOT NULL,                 -- Foreign key to reference the aircraft this seat belongs to (ID)
        flight_id INT NOT NULL,                   -- Foreign key to reference the flight this seat belongs to (ID)
        seat_number VARCHAR(10) NOT NULL,         -- Seat number, e.g., "1A", "2B"
        seat_type VARCHAR(50) NOT NULL,           -- Type of seat, e.g., "First Class", "Business
        seat_price NUMERIC(10, 2) NOT NULL,       -- Price of the seat
        seat_status VARCHAR(50) NOT NULL         -- Status of the seat, e.g., "Available", "Booked"
    )
    `

    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'seats' table: %v\n", err)
        return err
    }

    return nil
}

// SetSeatsForeignKeys sets foreign key constraints for the 'seats' table
func SetSeatsForeignKeys(db *sql.DB) error {
    query := `
    ALTER TABLE seats
    ADD CONSTRAINT fk_seat_aircraft
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id) ON DELETE CASCADE;

    ALTER TABLE seats
    ADD CONSTRAINT fk_seat_flight
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE;
    `

    _, err := db.Exec(query)
    if err != nil {
        log.Printf("Failed to set foreign key constraint for 'seats' table: %v\n", err)
        return err
    }

    return nil
}

// BulkInsertSeats inserts data into the 'seats' table in bulk
func BulkInsertSeats(db *sql.DB, flightID int, aircraftID int, seats []Seat) ([]Seat, error) {
    // Prepare the SQL statement for bulk insertion
    stmt, err := db.Prepare("INSERT INTO seats(aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status) VALUES($1, $2, $3, $4, $5, $6) RETURNING seat_id")
    if err != nil {
        log.Printf("Failed to prepare bulk insert statement for 'seats' table: %v\n", err)
        return nil, err
    }
    defer stmt.Close()

    // Begin the transaction
    tx, err := db.Begin()
    if err != nil {
        log.Printf("Failed to begin transaction for bulk insert into 'seats' table: %v\n", err)
        return nil, err
    }
    defer tx.Rollback()

    // Insert each seat into the 'seats' table
    for i := range seats {
        seat := &seats[i]

        err := tx.Stmt(stmt).QueryRow(
            seat.AircraftID,
            seat.FlightID,
            seat.SeatNumber,
            seat.SeatType,
            seat.SeatPrice,
            seat.SeatStatus,
        ).Scan(&seat.SeatID)
        if err != nil {
            log.Printf("Failed to insert seat into 'seats' table: %v\n", err)
            return nil, err
        }

        seat.FlightID = flightID
        seat.AircraftID = aircraftID
    }

    // Commit the transaction
    err = tx.Commit()
    if err != nil {
        log.Printf("Failed to commit transaction for bulk insert into 'seats' table: %v\n", err)
        return nil, err
    }

    return seats, nil
}

// BulkInsertSeatsFromCapacity inserts data into the 'seats' table in bulk
func BulkInsertSeatsFromCapacity(db *sql.DB, flightID int, aircraftID int, capacity int) ([]Seat, error) {
    // Prepare the SQL statement for bulk insertion
    stmt, err := db.Prepare("INSERT INTO seats(aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status) VALUES($1, $2, $3, $4, $5, $6) RETURNING seat_id")
    if err != nil {
        log.Printf("Failed to prepare bulk insert statement for 'seats' table: %v\n", err)
        return nil, err
    }
    defer stmt.Close()

    // Begin the transaction
    tx, err := db.Begin()
    if err != nil {
        log.Printf("Failed to begin transaction for bulk insert into 'seats' table: %v\n", err)
        return nil, err
    }
    defer tx.Rollback()

    // Insert each seat into the 'seats' table
    seats := []Seat{}
    for i := 0; i < capacity; i++ {
        seat := Seat{}
        seat.AircraftID = aircraftID
        seat.FlightID = flightID
        seatNumberFirst := (i / SeatPerRow) + 1
        seatNumberSecond := rune('A' + (i % SeatPerRow))
        seat.SeatNumber = fmt.Sprintf("%d%s", seatNumberFirst, string(seatNumberSecond))
        seat.SeatType = "Economy"
        seat.SeatPrice = 100.00
        seat.SeatStatus = "Available"

        err := tx.Stmt(stmt).QueryRow(
            seat.AircraftID,
            seat.FlightID,
            seat.SeatNumber,
            seat.SeatType,
            seat.SeatPrice,
            seat.SeatStatus,
        ).Scan(&seat.SeatID)
        if err != nil {
            log.Printf("Failed to insert seat into 'seats' table: %v\n", err)
            return nil, err
        }

        seats = append(seats, seat)
    }

    // Commit the transaction
    err = tx.Commit()
    if err != nil {
        log.Printf("Failed to commit transaction for bulk insert into 'seats' table: %v\n", err)
        return nil, err
    }

    return seats, nil
}

// GetSeatByID retrieves a seat by its ID
func GetSeatByID(db *sql.DB, seatID int) (*Seat, error) {
    query := `SELECT seat_id, aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status
              FROM seats WHERE seat_id = $1`

    seat := Seat{}
    err := db.QueryRow(query, seatID).Scan(
        &seat.SeatID,
        &seat.AircraftID,
        &seat.FlightID,
        &seat.SeatNumber,
        &seat.SeatType,
        &seat.SeatPrice,
        &seat.SeatStatus,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get seat: %v", err)
    }

    return &seat, nil
}

// GetSeatByNumber retrieves a seat by its number
func GetSeatByNumber(db *sql.DB, flightID int, aircraftID int, seatNumber string) (*Seat, error) {
    query := `SELECT seat_id, aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status
              FROM seats WHERE aircraft_id = $1 AND flight_id = $2 AND seat_number = $3`

    seat := Seat{}
    err := db.QueryRow(query, aircraftID, flightID, seatNumber).Scan(
        &seat.SeatID,
        &seat.AircraftID,
        &seat.FlightID,
        &seat.SeatNumber,
        &seat.SeatType,
        &seat.SeatPrice,
        &seat.SeatStatus,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get seat: %v", err)
    }

    return &seat, nil
}

// GetSeatsByAircraftID retrieves all seats for an aircraft
func GetSeatsByFlightAndAircraftID(db *sql.DB, flightID int, aircraftID int) ([]Seat, error) {
    query := `SELECT seat_id, aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status
              FROM seats WHERE aircraft_id = $1 AND flight_id = $2`

    rows, err := db.Query(query, aircraftID, flightID)
    if err != nil {
        log.Printf("Failed to get seats: %v\n", err)
        return nil, err
    }
    defer rows.Close()

    seats := []Seat{}
    for rows.Next() {
        var seat Seat
        if err := rows.Scan(&seat.SeatID, &seat.AircraftID, &seat.FlightID, &seat.SeatNumber, &seat.SeatType, &seat.SeatPrice, &seat.SeatStatus); err != nil {
            log.Printf("Failed to scan seats: %v\n", err)
            return nil, err
        }
        seats = append(seats, seat)
    }

    return seats, nil
}

// GetAllSeats retrieves all seats from the 'seats' table
func GetAllSeats(db *sql.DB) ([]Seat, error) {
    query := `SELECT seat_id, aircraft_id, flight_id, seat_number, seat_type, seat_price, seat_status FROM seats`

    rows, err := db.Query(query)
    if err != nil {
        log.Printf("Failed to get seats: %v\n", err)
        return nil, err
    }
    defer rows.Close()

    seats := []Seat{}
    for rows.Next() {
        var seat Seat
        if err := rows.Scan(&seat.SeatID, &seat.AircraftID, &seat.FlightID, &seat.SeatNumber, &seat.SeatType, &seat.SeatPrice, &seat.SeatStatus); err != nil {
            log.Printf("Failed to scan seats: %v\n", err)
            return nil, err
        }
        seats = append(seats, seat)
    }

    return seats, nil
}

// UpdateSeat updates a seat in the 'seats' table
func UpdateSeat(db *sql.DB, seat Seat) error {
    query := `UPDATE seats SET
        aircraft_id = $1,
        flight_id = $2,
        seat_number = $3,
        seat_type = $4,
        seat_price = $5,
        seat_status = $6
    WHERE seat_id = $7`

    _, err := db.Exec(query, seat.AircraftID, seat.FlightID, seat.SeatNumber, seat.SeatType, seat.SeatPrice, seat.SeatStatus, seat.SeatID)
    if err != nil {
        log.Printf("Failed to update seat: %v\n", err)
        return err
    }

    return nil
}

// RemoveSeat deletes a seat from the 'seats' table
func RemoveSeat(db *sql.DB, seatID int) error {
    query := `DELETE FROM seats WHERE seat_id = $1`

    _, err := db.Exec(query, seatID)
    if err != nil {
        log.Printf("Failed to delete seat: %v\n", err)
        return err
    }

    return nil
}

// RemoveSeatsByFlightAndAircraftID deletes all seats for an aircraft from the 'seats' table
func RemoveSeatsByFlightAndAircraftID(db *sql.DB, aircraftID int, flightID int) error {
    query := `DELETE FROM seats WHERE aircraft_id = $1 AND flight_id = $2`

    _, err := db.Exec(query, aircraftID, flightID)
    if err != nil {
        log.Printf("Failed to delete seats: %v\n", err)
        return err
    }

    return nil
}

// GetAvailableSeats retrieves all available seats from the 'seats' table
func GetAvailableSeats(db *sql.DB, flightID int, aircraftID int) ([]Seat, error) {
    query := `SELECT
        seat_id,
        aircraft_id,
        flight_id,
        seat_number,
        seat_type,
        seat_price,
        seat_status
    FROM seats
    WHERE seat_status = 'Available' AND
    aircraft_id = $1 AND
    flight_id = $2
    `

    rows, err := db.Query(query, aircraftID, flightID)
    if err != nil {
        log.Printf("Failed to get available seats: %v\n", err)
        return nil, err
    }
    defer rows.Close()

    seats := []Seat{}
    for rows.Next() {
        var seat Seat
        if err := rows.Scan(&seat.SeatID, &seat.AircraftID, &seat.FlightID, &seat.SeatNumber, &seat.SeatType, &seat.SeatPrice, &seat.SeatStatus); err != nil {
            log.Printf("Failed to scan available seats: %v\n", err)
            return nil, err
        }
        seats = append(seats, seat)
    }

    return seats, nil
}