package main

import (
	"fmt"
	"time"
	"webserver/database"
	"webserver/test"
)

func main() {
    // Create a new flight
    departureTime, _ := time.Parse(database.TIME_LAYOUT, time.Now().Format(database.TIME_LAYOUT))
    arrivalTime, _ := time.Parse(database.TIME_LAYOUT, time.Now().Add(2*time.Hour).Format(database.TIME_LAYOUT))
    flight := database.Flight{
        FlightNumber:     "QAL123",
        AircraftID:      1,
        DepartureAirport: "HAN",
        ArrivalAirport:   "SGN",
        DepartureTime:    departureTime,
        ArrivalTime:      arrivalTime,
        Status:          "On-time",
        Gate:           "A1",
        BoardTime:     departureTime.Add(-30 * time.Minute),
    }

    test.TestCreateFlight(flight)

    departureTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().Format(database.TIME_LAYOUT))
    arrivalTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().Add(2 * time.Hour).Format(database.TIME_LAYOUT))
    flight = database.Flight{
        FlightNumber:     "QAL456",
        AircraftID:      1,
        DepartureAirport: "CXR",
        ArrivalAirport:   "HAN",
        DepartureTime:    departureTime,
        ArrivalTime:      arrivalTime,
        Status:          "On-time",
        Gate:           "A2",
        BoardTime:     departureTime.Add(-30 * time.Minute),
    }

    test.TestCreateFlight(flight)

    flight = database.Flight{
        FlightID:               1,
        FlightNumber:           "QAL447",
        AircraftID:            1,
        DepartureAirport:       "HAN",
        ArrivalAirport:         "SGN",
        DepartureTime:          departureTime,
        ArrivalTime:            arrivalTime,
        Status:                "On-time",
        Gate:                 "A1",
        BoardTime:           departureTime.Add(-30 * time.Minute),
    }

    test.TestUpdateFlight(flight)

    test.TestGetFlights()
    test.TestRemoveFlight(1)

    test.TestCreateFlight(flight)

    test.TestGetFlights()

    departureTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().AddDate(0, 0, 2).Format(database.TIME_LAYOUT))
    arrivalTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().AddDate(0, 0, 2).Add(2 * time.Hour).Format(database.TIME_LAYOUT))
    flight = database.Flight{
        FlightNumber:     "QAL312",
        AircraftID:      1,
        DepartureAirport: "HAN",
        ArrivalAirport:   "CXR",
        DepartureTime:    departureTime,
        ArrivalTime:      arrivalTime,
        Status:          "On-time",
        Gate:           "A1",
        BoardTime:     departureTime.Add(-30 * time.Minute),
    }

    test.TestCreateFlight(flight)

    // flights, _ := test.TestGetOneWayFlightsByDeAndArrAirportAndTime("HAN", "CXR", departureTime)

    oldDepartureTime, _ := time.Parse(database.TIME_LAYOUT, time.Now().Format(database.TIME_LAYOUT))
    oldArrivalTime, _ := time.Parse(database.TIME_LAYOUT, time.Now().Add(2 * time.Hour).Format(database.TIME_LAYOUT))
    flight = database.Flight{
        FlightNumber:     "QAL123",
        AircraftID:      1,
        DepartureAirport: "CXR",
        ArrivalAirport:   "HAN",
        DepartureTime:    oldDepartureTime,
        ArrivalTime:      oldArrivalTime,
        Status:          "On-time",
        Gate:           "A1",
        BoardTime:     oldDepartureTime.Add(-30 * time.Minute),
    }
    test.TestCreateFlight(flight)

    departureTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().AddDate(0, 0, 2).Format(database.TIME_LAYOUT))
    arrivalTime, _ = time.Parse(database.TIME_LAYOUT, time.Now().AddDate(0, 0, 2).Add(2 * time.Hour).Format(database.TIME_LAYOUT))
    flight = database.Flight{
        FlightNumber:     "QAL456",
        AircraftID:      1,
        DepartureAirport: "HAN",
        ArrivalAirport:   "CXR",
        DepartureTime:    departureTime,
        ArrivalTime:      arrivalTime,
        Status:          "On-time",
        Gate:           "A2",
        BoardTime:     departureTime.Add(-30 * time.Minute),
    }
    test.TestCreateFlight(flight)

    // depFlights, retFlights, _ := test.TestGetRoundTripFlightsByDeAndArrAirportAndTime("CXR", "HAN", oldDepartureTime, departureTime)

    // fmt.Println(test.TestGetFlightsByFlightNumber("QAL123"))
    fmt.Println(test.TestGetFlight(1))

    // fmt.Println(depFlights)
    // fmt.Println(retFlights)

    // flights, _ := test.TestGetOneWayFlightsByDeAndArrAirportAndTime("HAN", "CXR", departureTime)
    // fmt.Println(flights)
}
