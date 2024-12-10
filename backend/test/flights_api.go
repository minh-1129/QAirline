package test

import (
    "bytes"
    "encoding/json"
    "fmt"
    "io"
    "log"
    "net/http"
    "net/url"
    "time"
    "webserver/api"
    "webserver/database"
)

// Function to send a GET request to retrieve a flight by ID
func TestGetFlight(flightID int) (database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:   fmt.Sprintf("%s/%d", api.FlightRoute, flightID),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, fmt.Sprintf("%d", flightID))

    resp, err := http.Get(url.String())
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }
    defer resp.Body.Close()

    // Read and print the response body
    var flight database.Flight
    if err := json.NewDecoder(resp.Body).Decode(&flight); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flight, nil
}

// Function to send a GET request to retrieve flights by flight number
func TestGetFlightsByFlightNumber(flightNumber string) ([]database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, "search/flight_number")

    // Add query parameters to the URL
    query := url.Query()
    query.Set("flight_number", flightNumber)
    url.RawQuery = query.Encode()

    req, err := http.NewRequest(http.MethodGet, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating GET request: %v", err)
    }

    // Send the GET request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }
    defer resp.Body.Close()

    // Get the flight
    var flights []database.Flight
    if err := json.NewDecoder(resp.Body).Decode(&flights); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flights, nil
}

// Function to send a GET request to retrieve all flights
func TestGetFlights() ([]database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:   api.FlightRoute,
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute)

    req, err := http.NewRequest(http.MethodGet, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating GET request: %v", err)
    }

    // Send the GET request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }
    defer resp.Body.Close()

    // Get all flights
    var flights []database.Flight
    if err := json.NewDecoder(resp.Body).Decode(&flights); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flights, nil
}

// Function to send a POST request to create a new flight
func TestCreateFlight(flight database.Flight) (string, error) {
    // Marshal the flight struct into JSON
    body, err := json.Marshal(flight)
    if err != nil {
        log.Fatalf("Error marshaling flight struct: %v", err)
    }

    // Create the POST request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:   api.FlightRoute,
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute)

    req, err := http.NewRequest(http.MethodPost, url.String(), bytes.NewBuffer(body))
    if err != nil {
        log.Fatalf("Error creating POST request: %v", err)
    }

    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending POST request: %v", err)
    }
    defer resp.Body.Close()

    bodyBytes, err := io.ReadAll(resp.Body)
    if err != nil {
        log.Fatalf("Error reading response body: %v", err)
    }
    body = bodyBytes

    return string(body), nil
}

// Function to send a PUT request to update a flight
func TestUpdateFlight(updatedFlight database.Flight) (string, error) {
    // Marshal the updated flight struct into JSON
    body, err := json.Marshal(updatedFlight)
    if err != nil {
        log.Fatalf("Error marshaling updated flight struct: %v", err)
    }

    // Create the PUT request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:   fmt.Sprintf("%s/%d", api.FlightRoute, updatedFlight.ID),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, fmt.Sprintf("%d", updatedFlight.FlightID))

    // Send the PUT request
    req, err := http.NewRequest(http.MethodPut, url.String(), bytes.NewBuffer(body))
    if err != nil {
        log.Fatalf("Error creating PUT request: %v", err)
    }

    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending PUT request: %v", err)
    }
    defer resp.Body.Close()

    bodyBytes, err := io.ReadAll(resp.Body)
    if err != nil {
        log.Fatalf("Error reading response body: %v", err)
    }
    body = bodyBytes

    return string(body), nil
}

// Function to send a DELETE request to remove a flight
func TestRemoveFlight(flightID int) (string, error) {
    // Create the DELETE request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:   fmt.Sprintf("%s/%d", api.FlightRoute, flightID),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, fmt.Sprintf("%d", flightID))

    // Send the DELETE request
    req, err := http.NewRequest(http.MethodDelete, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating DELETE request: %v", err)
    }

    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending DELETE request: %v", err)
    }
    defer resp.Body.Close()

    bodyBytes, err := io.ReadAll(resp.Body)
    if err != nil {
        log.Fatalf("Error reading response body: %v", err)
    }
    body := bodyBytes

    return string(body), nil
}

// Function to send a GET request to retrieve flights by departure and arrival airport
func TestGetFlightsByDeAndArrAirport(departureAirport, arrivalAirport string) ([]database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
        // Path:  fmt.Sprintf("%s/search", api.FlightRoute),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, "search")

    // Add query parameters to the URL
    query := url.Query()
    query.Set("departure", departureAirport)
    query.Set("arrival", arrivalAirport)
    url.RawQuery = query.Encode()

    req, err := http.NewRequest(http.MethodGet, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating GET request: %v", err)
    }

    // Send the GET request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }
    defer resp.Body.Close()

    // Get all flights
    var flights []database.Flight
    if err := json.NewDecoder(resp.Body).Decode(&flights); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flights, nil
}

// Function to send a GET request to retrieve one way flights by departure and arrival airport and departure time
func TestGetOneWayFlightsByDeAndArrAirportAndTime(departureAirport string, arrivalAirport string, departureTime time.Time) ([]database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, "search/oneway")

    // Add query parameters to the URL
    query := url.Query()
    query.Set("departure", departureAirport)
    query.Set("arrival", arrivalAirport)
    query.Set("departure_time", departureTime.String())
    url.RawQuery = query.Encode()

    req, err := http.NewRequest(http.MethodGet, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating GET request: %v", err)
    }

    // Send the GET request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }

    // Get all flights
    var flights []database.Flight
    if err := json.NewDecoder(resp.Body).Decode(&flights); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flights, nil
}

// Function to send a GET request to retrieve round trip flights by departure and arrival airport and departure time
func TestGetRoundTripFlightsByDeAndArrAirportAndTime(departureAirport string, arrivalAirport string, departureTime time.Time, returnTime time.Time) ([]database.Flight, []database.Flight, error) {
    // Create the GET request
    url := &url.URL{
        Scheme: "http",
        Host:   fmt.Sprintf("%s:%d", api.API_HOST, api.API_PORT),
    }
    url = url.JoinPath(api.API_BASE_URL, api.FlightRoute, "search/roundtrip")

    // Add query parameters to the URL
    query := url.Query()
    query.Set("departure", departureAirport)
    query.Set("arrival", arrivalAirport)
    query.Set("departure_time", departureTime.String())
    query.Set("return_time", returnTime.String())
    url.RawQuery = query.Encode()

    req, err := http.NewRequest(http.MethodGet, url.String(), nil)
    if err != nil {
        log.Fatalf("Error creating GET request: %v", err)
    }

    // Send the GET request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        log.Fatalf("Error sending GET request: %v", err)
    }

    // Get all flights
    var flights database.FlightsResponse
    if err := json.NewDecoder(resp.Body).Decode(&flights); err != nil {
        log.Fatalf("Error decoding response body: %v", err)
    }

    return flights.DepartingFlights, flights.ReturnFlights, nil
}