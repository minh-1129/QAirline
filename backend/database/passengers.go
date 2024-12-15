package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
)

// Passenger struct for passengers table
type Passenger struct {
    PassengerID int `json:"passenger_id"`
    BookingID   int `json:"booking_id"`
    CitizenID   sql.NullString `json:"citizen_id"`
    FirstName   string `json:"first_name"`
    LastName    string `json:"last_name"`
    SeatNumber  string `json:"seat_number"`
    PhoneNumber sql.NullString `json:"phone_number"`
    Email       sql.NullString `json:"email"`
    Dob         time.Time `json:"dob"`
    Gender      string `json:"gender"`
}

// CreatePassengersTable creates the 'passenger' table
func CreatePassengersTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS passengers (
        passenger_id SERIAL PRIMARY KEY,               -- Unique identifier for the passenger
        booking_id INT NOT NULL,                       -- Foreign key to reference the booking this passenger belongs to (ID)
        citizen_id VARCHAR(100) UNIQUE,       -- Foreign key to reference the user who booked this passenger (ID)
        first_name VARCHAR(100) NOT NULL,              -- First name of the passenger
        last_name VARCHAR(100) NOT NULL,               -- Last name of the passenger
        seat_number VARCHAR(10) NOT NULL,              -- Seat number, e.g., "1A", "2B"
        phone_number VARCHAR(20),             -- PhoneNumber number of the passenger
        email VARCHAR(100),                   -- Email address of the passenger
        dob DATE NOT NULL,                             -- Date of birth of the passenger
        gender VARCHAR(10) NOT NULL
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'passengers' table: %v\n", err)
        return err
    }

    return nil
}

// SetPassengersForeignKeys sets foreign key constraints for the 'passengers' table
func SetPassengersForeignKeys(db *sql.DB) error {
    query := `
    ALTER TABLE passengers
    ADD CONSTRAINT fk_passenger_booking
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE SET NULL;
    `

    _, err := db.Exec(query)
    if err != nil {
        log.Printf("Failed to set foreign key constraint for 'passengers' table: %v\n", err)
        return err
    }

    return nil
}

// GetPassengerByID retrieves a passenger by their ID
func GetPassengerByID(db *sql.DB, passengerID int) (*Passenger, error) {
    query := `SELECT passenger_id, booking_id, citizen_id, first_name, last_name, seat_number, phone_number, email, dob, gender
              FROM passengers WHERE passenger_id = $1`

    passenger := Passenger{}
    err := db.QueryRow(query, passengerID).Scan(
        &passenger.PassengerID,
        &passenger.BookingID,
        &passenger.CitizenID,
        &passenger.FirstName,
        &passenger.LastName,
        &passenger.SeatNumber,
        &passenger.PhoneNumber,
        &passenger.Email,
        &passenger.Dob,
        &passenger.Gender,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get passenger: %v", err)
    }

    return &passenger, nil
}

// InsertPassenger inserts a new passenger into the passengers table
func InsertPassenger(db *sql.DB, passenger *Passenger) (int, error) {
    query := `
    INSERT INTO passengers (booking_id, citizen_id, first_name, last_name, seat_number, phone_number, email, dob, gender)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING passenger_id
    `

    dob := passenger.Dob.Format(DOB_LAYOUT)

    var passengerID int
    err := db.QueryRow(
        query,
        passenger.BookingID,
        passenger.CitizenID,
        passenger.FirstName,
        passenger.LastName,
        passenger.SeatNumber,
        passenger.PhoneNumber,
        passenger.Email,
        dob,
        passenger.Gender,
    ).Scan(&passengerID)
    if err != nil {
        return 0, fmt.Errorf("could not insert passenger: %v", err)
    }

    return passengerID, nil
}

// UpdatePassenger updates a passenger's details
func UpdatePassenger(db *sql.DB, passenger *Passenger) error {
    query := `
    UPDATE passengers
    SET booking_id = $1,
    citizen_id = $2,
    first_name = $3,
    last_name = $4,
    seat_number = $5,
    phone_number = $6,
    email = $7,
    dob = $8,
    gender = $9
    WHERE passenger_id = $10
    `

    dob := passenger.Dob.Format(DOB_LAYOUT)

    _, err := db.Exec(query,
        passenger.BookingID,
        passenger.CitizenID,
        passenger.FirstName,
        passenger.LastName,
        passenger.SeatNumber,
        passenger.PhoneNumber,
        passenger.Email,
        dob,
        passenger.Gender,
        passenger.PassengerID,
    )
    if err != nil {
        log.Printf("could not update passenger: %v\n", err)
        return err
    }

    return nil
}

// RemovePassenger removes a passenger by their ID
func RemovePassenger(db *sql.DB, passengerID int) error {
    query := `DELETE FROM passengers WHERE passenger_id = $1`

    _, err := db.Exec(query, passengerID)
    if err != nil {
        log.Printf("could not remove passenger: %v\n", err)
        return err
    }

    return nil
}

// GetAllPassengers retrieves all passengers from the 'passengers' table
func GetAllPassengers(db *sql.DB) ([]Passenger, error) {
    query := `SELECT passenger_id, booking_id, citizen_id, first_name, last_name, seat_number, phone_number, email, dob, gender FROM passengers`

    rows, err := db.Query(query)
    if err != nil {
        return nil, fmt.Errorf("could not get passengers: %v", err)
    }
    defer rows.Close()

    passengers := []Passenger{}
    for rows.Next() {
        var passenger Passenger
        if err := rows.Scan(
            &passenger.PassengerID,
            &passenger.BookingID,
            &passenger.CitizenID,
            &passenger.FirstName,
            &passenger.LastName,
            &passenger.SeatNumber,
            &passenger.PhoneNumber,
            &passenger.Email,
            &passenger.Dob,
            &passenger.Gender,
        ); err != nil {
            return nil, fmt.Errorf("could not get passengers: %v", err)
        }
        passengers = append(passengers, passenger)
    }

    return passengers, nil
}

// GetPassengersByBookingID retrieves all passengers of a specific booking
func GetPassengersByBookingID(db *sql.DB, bookingID int) ([]Passenger, error) {
    query := `SELECT
        passenger_id,
        booking_id,
        citizen_id,
        first_name,
        last_name,
        seat_number,
        phone_number,
        email,
        dob,
        gender
    FROM passengers WHERE booking_id = $1
    `

    rows, err := db.Query(query, bookingID)
    if err != nil {
        return nil, fmt.Errorf("could not get passengers: %v", err)
    }
    defer rows.Close()

    passengers := []Passenger{}
    for rows.Next() {
        var passenger Passenger
        if err := rows.Scan(
            &passenger.PassengerID,
            &passenger.BookingID,
            &passenger.CitizenID,
            &passenger.FirstName,
            &passenger.LastName,
            &passenger.SeatNumber,
            &passenger.PhoneNumber,
            &passenger.Email,
            &passenger.Dob,
            &passenger.Gender,
        ); err != nil {
            return nil, fmt.Errorf("could not get passengers: %v", err)
        }
        passengers = append(passengers, passenger)
    }

    return passengers, nil
}