package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/url"
	"strconv"

	"database/sql"
	"webserver/api"
	"webserver/api_test"
	"webserver/database"

	"github.com/brianvoe/gofakeit/v7"
)

// initDatabase initializes the database
func initDatabase(useLocal bool) (*sql.DB, error) {
    db, err := database.CreateConnection(useLocal)
    if err != nil {
        log.Printf("Error connecting to the database: %v\n", err)
        return nil, err
    }

    return db, nil
}

func createSeats(api_url *url.URL) error {
    aircraft := api_test.GenerateAircraft()
    fmt.Println(aircraft)
    resp, err := api_test.SendPostRequest(api_url.JoinPath(api.AircraftRoute).String(), aircraft)
    if err != nil {
        log.Printf("Error sending post request: %v\n", err)
        return err
    }
    fmt.Println(string(resp.Body))
    err = json.Unmarshal(resp.Body, &aircraft)
    if err != nil {
        log.Printf("Error unmarshalling response: %v\n", err)
        return err
    }

    flight := api_test.GenerateFlight()
    flight.AircraftID = 1
    flight.DepartureAirport = "HAN"
    flight.ArrivalAirport = "SGN"
    // flight.
    fmt.Println(flight)
    resp, err = api_test.SendPostRequest(api_url.JoinPath(api.FlightRoute).String(), flight)
    if err != nil {
        log.Printf("Error sending post request: %v\n", err)
        return err
    }
    fmt.Println(string(resp.Body))
    err = json.Unmarshal(resp.Body, &flight)
    if err != nil {
        log.Printf("Error unmarshalling response: %v\n", err)
        return err
    }

    resp, err = api_test.SendPostRequest(
        api_url.JoinPath(
            api.SeatRoute,
            "flight_id", strconv.Itoa(flight.FlightID),
            "aircraft_id", strconv.Itoa(aircraft.AircraftID),
            "capacity", strconv.Itoa(aircraft.Capacity),
        ).String(),
        aircraft,
    )
    if err != nil {
        log.Printf("Error sending post request: %v\n", err)
        return err
    }
    fmt.Println(resp)

    return nil
}

func main() {
    useLocal := true
    db, err := initDatabase(useLocal)
    if err != nil {
        log.Printf("Error initializing the database: %v\n", err)
        return
    }
    defer database.CloseConnection(db)

    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
    }
    api_url := url.JoinPath(api.API_BASE_URL)

    gofakeit.GlobalFaker = gofakeit.New(api_test.SEED)

    err = createSeats(api_url)
    if err != nil {
        log.Printf("Error creating seats: %v\n", err)
        return
    }

    // passenger := api_test.GeneratePassenger()
    // passenger = api_test.GeneratePassenger()
    // fmt.Println(passenger)
}