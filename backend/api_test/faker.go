package api_test

import (
	"database/sql"
	"fmt"
	// "strings"
	"time"

	// "webserver/api"
	"webserver/database"

	"github.com/brianvoe/gofakeit/v7"
)

const SEED = 18022004

func GenerateFlight() database.Flight {
    // Generate random times
    departureTime := gofakeit.GlobalFaker.Date()
    arrivalTime := departureTime.Add(time.Duration(gofakeit.Number(1, 10)) * time.Hour) // Add 1-10 hours
    boardTime := departureTime.Add(-30 * time.Minute)                                  // 30 minutes before departure

    return database.Flight{
        FlightNumber:     gofakeit.GlobalFaker.LetterN(2) + gofakeit.DigitN(4), // Example: AB1234
        AircraftID:       gofakeit.GlobalFaker.Number(1, 100),
        DepartureAirport: gofakeit.GlobalFaker.RandomString([]string{"SFO", "LAX", "JFK", "ORD", "DFW", "ATL", "DEN", "SEA", "LAS", "MCO"}),
        ArrivalAirport:   gofakeit.GlobalFaker.RandomString([]string{"SFO", "LAX", "JFK", "ORD", "DFW", "ATL", "DEN", "SEA", "LAS", "MCO"}),
        DepartureTime:    departureTime,
        ArrivalTime:      arrivalTime,
        Status:           gofakeit.GlobalFaker.RandomString([]string{"On Time", "Delayed", "Cancelled"}),
        Gate:             fmt.Sprintf("%d", gofakeit.Number(1, 50)),
        BoardTime:        boardTime,
        Price:            gofakeit.GlobalFaker.Price(100, 1000), // Random price between 100 and 1000
    }
}

func GenerateAircraft() database.Aircraft {
    return database.Aircraft{
        AircraftName: gofakeit.GlobalFaker.RandomString([]string{"Boeing 737", "Boeing 747", "Airbus A320", "Airbus A380"}),
        AircraftType: gofakeit.GlobalFaker.RandomString([]string{"Narrow-Body", "Wide-Body"}),
        AircraftManufacturer: gofakeit.GlobalFaker.RandomString([]string{"Boeing", "Airbus"}),
        Capacity:     gofakeit.GlobalFaker.Number(40, 50),
    }
}

func GeneratePassenger() database.Passenger {
    person := gofakeit.GlobalFaker.Person()

    return database.Passenger{
        BookingID:   gofakeit.GlobalFaker.Number(1, 100),
        CitizenID:   sql.NullString{person.SSN, true},
        FirstName:   person.FirstName,
        LastName:    person.LastName,
        PhoneNumber: sql.NullString{person.Contact.Phone, true},
        Email:       sql.NullString{person.Contact.Email, true},
        Dob:         gofakeit.Date(),
        Gender:      person.Gender,
    }
}