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
    TotalPassengers int `json:"total_passengers"`
    BookingDate     time.Time `json:"booking_date"`
    SeatNumber      string `json:"seat_number"`
    Price           float64 `json:"price"`
}

// CreateBookingsTable creates the 'bookings' table with foreign key references to flights
func CreateBookingsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE bookings (
        booking_id SERIAL PRIMARY KEY,
        flight_id INT NOT NULL,  -- Foreign key to reference the flight this seat belongs to (ID)
        citizen_id VARCHAR(100) UNIQUE NOT NULL,  -- Foreign key to reference the passenger who booked this seat (ID)
        total_passengers INT NOT NULL,  -- Total number of passengers in the booking
        booking_date TIMESTAMPTZ NOT NULL,  -- Date the booking was made
        seat_number VARCHAR(10) NOT NULL,  -- Booking number, e.g., "1A", "2B"
        price DECIMAL(20, 2) NOT NULL DEFAULT 0.00  -- Price of the seat
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Fatalf("Failed to create 'bookings' table: %v", err)
    }

    return nil
}

// SetBookingsForeignKeys sets foreign key constraints for the 'bookings' table
func SetBookingsForeignKeys(db *sql.DB) error {
    query := `
    ALTER TABLE bookings
    ADD CONSTRAINT fk_booking_flight
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE SET NULL;

    ALTER TABLE bookings
    ADD CONSTRAINT fk_booking_user
    FOREIGN KEY (citizen_id) REFERENCES users(citizen_id) ON DELETE SET NULL;
    `

    _, err := db.Exec(query)
    if err != nil {
        log.Fatalf("Failed to set foreign key constraint for 'bookings' table: %v", err)
    }

    return nil
}

// GetBookingByID retrieves a seat by its ID
func GetBookingByID(db *sql.DB, seatID int) (*Booking, error) {
    query := `SELECT booking_id, flight_id, citizen_id, total_passengers, booking_date, seat_number, price FROM bookings WHERE booking_id = $1`

    var seat Booking
    err := db.QueryRow(query, seatID).Scan(&seat.BookingID, &seat.FlightID, &seat.CitizenID, &seat.TotalPassengers, &seat.BookingDate, &seat.SeatNumber, &seat.Price)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }

    return &seat, nil
}

// GetBookingByFlightID retrieves a booking by its flight ID
func GetBookingByFlightID(db *sql.DB, flightID int) ([]Booking, error) {
    query := `SELECT booking_id, flight_id, citizen_id, total_passengers, booking_date, seat_number, price FROM bookings WHERE flight_id = $1`

    rows, err := db.Query(query, flightID)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }
    defer rows.Close()

    var bookings []Booking
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(&booking.BookingID, &booking.FlightID, &booking.CitizenID, &booking.TotalPassengers, &booking.BookingDate, &booking.SeatNumber, &booking.Price); err != nil {
            return nil, fmt.Errorf("could not get booking: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}

// GetBookingByCitizenID retrieves a booking by its citizen ID
func GetBookingByCitizenID(db *sql.DB, citizenID int) ([]Booking, error) {
    query := `SELECT booking_id, flight_id, citizen_id, total_passengers, booking_date, seat_number, price FROM bookings WHERE citizen_id = $1`

    rows, err := db.Query(query, citizenID)
    if err != nil {
        return nil, fmt.Errorf("could not get booking: %v", err)
    }
    defer rows.Close()

    var bookings []Booking
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(&booking.BookingID, &booking.FlightID, &booking.CitizenID, &booking.TotalPassengers, &booking.BookingDate, &booking.SeatNumber, &booking.Price); err != nil {
            return nil, fmt.Errorf("could not get booking: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}

// InsertBooking inserts a new seat into the bookings table
func InsertBooking(db *sql.DB, seat *Booking) (int, error) {
    query := `
    INSERT INTO bookings (flight_id, citizen_id, total_passengers, booking_date, seat_number, price)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING booking_id
    `

    var seatID int
    err := db.QueryRow(
        query,
        seat.FlightID,
        seat.CitizenID,
        seat.TotalPassengers,
        seat.BookingDate,
        seat.SeatNumber,
        seat.Price,
    ).Scan(&seatID)
    if err != nil {
        return 0, fmt.Errorf("could not insert seat: %v", err)
    }

    return seatID, nil
}

// UpdateBooking updates a seat's details
func UpdateBooking(db *sql.DB, seat *Booking) error {
    query := `
    UPDATE bookings
    SET flight_id = $1, citizen_id = $2, total_passengers = $3, booking_date = $4, seat_number = $5, price = $6
    WHERE booking_id = $7
    `

    _, err := db.Exec(query,
        seat.FlightID,
        seat.CitizenID,
        seat.TotalPassengers,
        seat.BookingDate,
        seat.SeatNumber,
        seat.Price,
        seat.BookingID,
    )
    if err != nil {
        log.Fatalf("could not update seat: %v", err)
    }

    return nil
}

// RemoveBooking removes a seat by its ID
func RemoveBooking(db *sql.DB, seatID int) error {
    query := `DELETE FROM bookings WHERE booking_id = $1`

    _, err := db.Exec(query, seatID)
    if err != nil {
        log.Fatalf("could not remove seat: %v", err)
    }

    return nil
}

// GetAllBookings retrieves all bookings from the 'bookings' table
func GetAllBookings(db *sql.DB) ([]Booking, error) {
    query := `SELECT booking_id, flight_id, citizen_id, total_passengers, booking_date, seat_number, price FROM bookings`

    rows, err := db.Query(query)
    if err != nil {
        return nil, fmt.Errorf("could not get bookings: %v", err)
    }
    defer rows.Close()

    var bookings []Booking
    for rows.Next() {
        var booking Booking
        if err := rows.Scan(&booking.BookingID, &booking.FlightID, &booking.CitizenID, &booking.TotalPassengers, &booking.BookingDate, &booking.SeatNumber, &booking.Price); err != nil {
            return nil, fmt.Errorf("could not get bookings: %v", err)
        }
        bookings = append(bookings, booking)
    }

    return bookings, nil
}