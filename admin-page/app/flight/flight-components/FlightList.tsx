"use client";
import React, { useState, useEffect } from "react";
import FlightCard from "./FlightCard";
import { selectedCountries } from "./NewFlightInputForm";

function FlightList() {
  const [flightList, setFlightList] = useState([]);
  const [airportsList, setAirportsList] = useState([]);

  const fetchAirports = async () => {
    try {
      const response = await fetch(
        "http://112.137.129.161:1803/api/v1/airports"
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      let airports = await response.json();
      airports = airports.filter((airport) =>
        selectedCountries.includes(airport.country)
      );
      setAirportsList(airports);
    } catch (err) {
      console.error(err.message);
    }
  };

  useEffect(() => {
    fetchAirports();
  }, []);

  const fetchFlights = async () => {
    try {
      const response = await fetch(
        "http://112.137.129.161:1803/api/v1/flights"
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();
      setFlightList(result);
    } catch (err) {
      console.log(err.message);
    }
  };

  useEffect(() => {
    fetchFlights();
  }, []);

  function handleRemoveFlight (flightId) {
    fetch(`http://112.137.129.161:1803/api/v1/flights/${flightId}`, {
      method: "DELETE"
    }).then((response) => {
      console.log(response);
      fetchFlights();
    })
  }

  return (
    <div>
      {flightList.map((flight, index) => {
        return (
          <div className="flex-row" key={index}>
            <FlightCard
              flight_id={flight.flight_id}
              airportsList={airportsList}
              aircraftId={flight.aircraft_id}
              arrivalTime={flight.arrival_time}
              arrivalAirport={flight.arrival_airport}
              boardTime={flight.board_time}
              departureAirport={flight.departure_airport}
              departureTime={flight.departure_time}
              flightNumber={flight.flight_number}
              gate={flight.gate}
              status={flight.status}
              handleRemoveFlight={handleRemoveFlight}
              price={flight.price}
            />
          </div>
        );
      })}
    </div>
  );
}

export default FlightList;
