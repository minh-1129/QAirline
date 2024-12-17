"use client";
import React, { useState, useEffect } from "react";
import Select from "react-select";

export const selectedCountries = ["Vietnam", "Thailand", "Singapore"];

function NewFlightInputForm() {
  const [airportOptions, setAirportOptions] = useState([]);
  const [planeOptions, setPlaneOptions] = useState([]);

  const [flightNumber, setFlightNumber] = useState('');
  const [planeModel, setPlaneModel] = useState('');
  const [departureAirport, setDepartureAirport] = useState("");
  const [arrivalAirport, setArrivalAirport] = useState("");

  useEffect(() => {
    const fetchAirports = async () => {
      try {
        const response = await fetch(
          "http://112.137.129.161:1803/api/v1/airports"
        );
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        let result = await response.json();
        result = result.filter((airport) =>
          selectedCountries.includes(airport.country) && airport.iata !== '\\\\N'
        );
        setAirportOptions(
          result.map(airport => ({
            value: airport.iata,
            label: `${airport.name} (${airport.city}, ${airport.country})`,
          }))
        );
      } catch (err) {
        console.error(err.message);
      }
    };

    fetchAirports();
  }, []);

  useEffect(() => {
    const fetchPlanes = async () => {
      try {
        const response = await fetch(
          "http://112.137.129.161:1803/api/v1/aircrafts"
        );
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const result = await response.json();
        setPlaneOptions(
          result.map(plane => ({
            value: plane.aircraft_id,
            label: `${plane.aircraft_manufacturer} ${plane.aircraft_name}`
          }))
        );
      } catch (err) {
        console.error(err.message);
      }
    };

    fetchPlanes();
  }, []);

  

  function handleSubmitFlight () {
    fetch('http://112.137.129.161:1803/api/v1/flights', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(flight)
    }).then((response) => {
      console.log('new flight added');
      console.log(response);
    })
  }

  const handleDepartureAirport = (e) => setDepartureAirport(e)
  const handleArrivalAirport = (e) => setArrivalAirport(e);
  const handlePlaneModel = (e) => setPlaneModel(e);

  return (
    <div
      id="flight-form"
      className="max-w-lg mx-auto p-6 bg-white shadow-md rounded-lg"
    >
      <h2 className="text-2xl font-semibold mb-6 text-gray-800">
        New Flight Information
      </h2>

      <div className="mb-4">
        <label
          htmlFor="flightNumber"
          className="block text-sm font-medium text-gray-700"
        >
          Flight Number:
        </label>
        <input
          type="text"
          id="flightNumber"
          name="flightNumber"
          placeholder="Enter flight number"
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="planeName"
          className="block text-sm font-medium text-gray-700"
        >
          Plane Model:
        </label>
        <Select
          options={planeOptions}
          value={planeModel}
          onChange={handlePlaneModel}
          className="mt-1"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="startAirport"
          className="block text-sm font-medium text-gray-700"
        >
          Departure Airport:
        </label>
        <Select
          options={airportOptions}
          value={departureAirport}
          onChange={handleDepartureAirport}
          className="mt-1"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="destinationAirport"
          className="block text-sm font-medium text-gray-700"
        >
          Arrival Airport:
        </label>
        <Select
          options={airportOptions}
          value={arrivalAirport}
          onChange={handleArrivalAirport}
          className="mt-1"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="departureTime"
          className="block text-sm font-medium text-gray-700"
        >
          Departure Time:
        </label>
        <input
          type="datetime-local"
          id="departureTime"
          name="departureTime"
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="arrivalTime"
          className="block text-sm font-medium text-gray-700"
        >
          Arrival Time:
        </label>
        <input
          type="datetime-local"
          id="arrivalTime"
          name="arrivalTime"
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <button
        type="submit"
        className="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 shadow-md focus:outline-none"
        onClick={handleSubmitFlight}
      >
        Submit Flight Information
      </button>
    </div>
  );
}

export default NewFlightInputForm;
