package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
)

// Booking struct for bookings table
type Booking struct {
    BookingID       int `json:"booking_id"`
    FlightID        int `json:"flight_id"`
    CitizenID       string `json:"citizen_id"`
    FirstName       string `json:"first_name"`
    LastName        string `json:"last_name"`
    PhoneNumber     sql.NullString `json:"phone_number"`
    Email           sql.NullString `json:"email"`
    Dob             time.Time `json:"dob"`
    TotalPassengers int `json:"total_passengers"`
    BookingDate     time.Time `json:"booking_date"`
    TotalPrice           float64 `json:"total_price"`
}

// CreateBookingsTable creates the 'bookings' table with foreign key references to flights
func CreateBookingsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS bookings (
        booking_id SERIAL PRIMARY KEY,
        flight_id INT NOT NULL,  -- Foreign key to reference the flight this seat belongs to (ID)
        citizen_id VARCHAR(100) NOT NULL,  -- Foreign key to reference the passenger who booked this seat (ID)
        first_name VARCHAR(100) NOT NULL,  -- First name of the passenger
        last_name VARCHAR(100) NOT NULL,  -- Last name of the passenger
        phone_number VARCHAR(20),  -- PhoneNumber number of the passenger
        email VARCHAR(100),  -- Email address of the passenger
        dob DATE NOT NULL,  -- Date of birth of the passenger
        total_passengers INT NOT NULL,  -- Total number of passengers in the booking
        booking_date TIMESTAMPTZ NOT NULL,  -- Date the booking was made
        total_price DECIMAL(20, 2) NOT NULL DEFAULT 0.00  -- Price of the seat
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'bookings' table: %v\n", err)
        return err
    }

    return nil
}

// SetBookingsForeignKeys sets foreign key constraints for the 'bookings' table
func SetBookingsForeignKeys(db *sql.DB) error {
    query := `
    ALTER TABLE bookings
    ADD CONSTRAINT fk_booking_flight
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE SET NULL;

    -- ALTER TABLE bookings
    -- ADD CONSTRAINT fk_booking_user
    -- FOREIGN KEY (citizen_id) REFERENCES users(citizen_id) ON DELETE SET NULL;
    `

    _, err := db.Exec(query)
    if err != nil {
        log.Printf("Failed to set foreign key constraint for 'bookings' table: %v\n", err)
        return err
    }

    return nil
}

// GetBookingByID retrieves a seat by its ID
func GetBookingByID(db *sql.DB, bookingID int) (*Booking, error) {
    query := `
    SELECT
        booking_id,
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    FROM bookings WHERE booking_id = $1
    `

    booking := Booking{}
    err := db.QueryRow(query, bookingID).Scan(
        &booking.BookingID,
        &booking.FlightID,
        &booking.CitizenID,
        &booking.FirstName,
        &booking.LastName,
        &booking.PhoneNumber,
        &booking.Email,
        &booking.Dob,
        &booking.TotalPassengers,
        &booking.BookingDate,
        &booking.TotalPrice,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }

    return &booking, nil
}

// GetBookingByFlightID retrieves a booking by its flight ID
func GetBookingByFlightID(db *sql.DB, flightID int) ([]Booking, error) {
    query := `
    SELECT
        booking_id,
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    FROM bookings WHERE flight_id = $1
    `

    rows, err := db.Query(query, flightID)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }
    defer rows.Close()

    bookings := []Booking{}
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(
            &booking.BookingID,
            &booking.FlightID,
            &booking.CitizenID,
            &booking.FirstName,
            &booking.LastName,
            &booking.PhoneNumber,
            &booking.Email,
            &booking.Dob,
            &booking.TotalPassengers,
            &booking.BookingDate,
            &booking.TotalPrice,
        ); err != nil {
            return nil, fmt.Errorf("could not get booking: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}

// GetBookingByCitizenID retrieves a booking by its citizen ID
func GetBookingByCitizenID(db *sql.DB, citizenID string) ([]Booking, error) {
    query := `
    SELECT
        booking_id,
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    FROM bookings WHERE citizen_id = $1
    `

    rows, err := db.Query(query, citizenID)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }
    defer rows.Close()

    bookings := []Booking{}
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(
            &booking.BookingID,
            &booking.FlightID,
            &booking.CitizenID,
            &booking.FirstName,
            &booking.LastName,
            &booking.PhoneNumber,
            &booking.Email,
            &booking.Dob,
            &booking.TotalPassengers,
            &booking.BookingDate,
            &booking.TotalPrice,
        ); err != nil {
            return nil, fmt.Errorf("could not get booking: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}

// GetBookingByFlightName retrieves a booking by its flight name
func GetBookingByFlightName(db *sql.DB, flightName string) ([]Booking, error) {
    query := `
    SELECT
        booking_id,
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    FROM bookings
    JOIN flights ON bookings.flight_id = flights.flight_id
    WHERE flights.flight_name = $1
    `

    rows, err := db.Query(query, flightName)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }
    defer rows.Close()

    bookings := []Booking{}
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(
            &booking.BookingID,
            &booking.FlightID,
            &booking.CitizenID,
            &booking.FirstName,
            &booking.LastName,
            &booking.PhoneNumber,
            &booking.Email,
            &booking.Dob,
            &booking.TotalPassengers,
            &booking.BookingDate,
            &booking.TotalPrice,
        ); err != nil {
            return nil, fmt.Errorf("could not get booking: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}

// InsertBooking inserts a new seat into the bookings table
func InsertBooking(db *sql.DB, booking *Booking) (int, error) {
    query := `
    INSERT INTO bookings (
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING booking_id
    `

    var bookingID int
    err := db.QueryRow(
        query,
        &booking.FlightID,
        &booking.CitizenID,
        &booking.FirstName,
        &booking.LastName,
        &booking.PhoneNumber,
        &booking.Email,
        &booking.Dob,
        &booking.TotalPassengers,
        &booking.BookingDate,
        &booking.TotalPrice,
    ).Scan(&bookingID)
    if err != nil {
        return 0, fmt.Errorf("could not insert seat: %v", err)
    }

    return bookingID, nil
}

// UpdateBooking updates a seat's details
func UpdateBooking(db *sql.DB, booking *Booking) error {
    query := `
    UPDATE bookings
    SET
        flight_id = $1,
        citizen_id = $2,
        first_name = $3,
        last_name = $4,
        phone_number = $5,
        email = $6,
        dob = $7,
        total_passengers = $8,
        booking_date = $9,
        total_price = $10
    WHERE booking_id = $11
    `

    _, err := db.Exec(query,
        booking.FlightID,
        booking.CitizenID,
        booking.FirstName,
        booking.LastName,
        booking.PhoneNumber,
        booking.Email,
        booking.Dob,
        booking.TotalPassengers,
        booking.BookingDate,
        booking.TotalPrice,
        booking.BookingID,
    )
    if err != nil {
        log.Printf("could not update seat: %v\n", err)
        return err
    }

    return nil
}

// RemoveBooking removes a seat by its ID
func RemoveBooking(db *sql.DB, seatID int) error {
    query := `DELETE FROM bookings WHERE booking_id = $1`

    _, err := db.Exec(query, seatID)
    if err != nil {
        log.Printf("could not remove seat: %v\n", err)
        return err
    }

    return nil
}

// GetAllBookings retrieves all bookings from the 'bookings' table
func GetAllBookings(db *sql.DB) ([]Booking, error) {
    query := `
    SELECT
        booking_id,
        flight_id,
        citizen_id,
        first_name,
        last_name,
        phone_number,
        email,
        dob,
        total_passengers,
        booking_date,
        total_price
    FROM bookings
    `

    rows, err := db.Query(query)
    if err != nil {
        return []Booking{}, fmt.Errorf("could not get bookings: %v", err)
    }
    defer rows.Close()

    bookings := []Booking{}
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(
            &booking.BookingID,
            &booking.FlightID,
            &booking.CitizenID,
            &booking.FirstName,
            &booking.LastName,
            &booking.PhoneNumber,
            &booking.Email,
            &booking.Dob,
            &booking.TotalPassengers,
            &booking.BookingDate,
            &booking.TotalPrice,
        ); err != nil {
            return []Booking{}, fmt.Errorf("could not get bookings: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}