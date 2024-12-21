"use client";
import React, { useState, useEffect } from "react";
import Select from "react-select";

export const selectedCountries = ["Vietnam", "Thailand", "Singapore"];

function NewFlightInputForm() {
  const [airportOptions, setAirportOptions] = useState([]);
  const [planeOptions, setPlaneOptions] = useState([]);

  const [flightNumber, setFlightNumber] = useState("");
  const [planeModel, setPlaneModel] = useState("");
  const [departureAirport, setDepartureAirport] = useState("");
  const [arrivalAirport, setArrivalAirport] = useState("");
  const [departureTime, setDepartureTime] = useState("");
  const [arrivalTime, setArrivalTime] = useState("");
  const [boardTime, setBoardTime] = useState("");
  const [price, setPrice] = useState();

  const now = new Date();
  const formattedNow = now.toISOString().slice(0, 16);

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
        result = result.filter(
          (airport) =>
            selectedCountries.includes(airport.country) &&
            airport.iata !== "\\\\N"
        );
        setAirportOptions(
          result.map((airport) => ({
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
          result.map((plane) => ({
            value: plane.aircraft_id,
            label: `${plane.aircraft_manufacturer} ${plane.aircraft_name}`,
          }))
        );
      } catch (err) {
        console.error(err.message);
      }
    };

    fetchPlanes();
  }, []);

  function handleSubmitFlight(e) {
    console.log(arrivalTime);
    if (
      flightNumber &&
      planeModel &&
      departureAirport &&
      arrivalAirport &&
      departureTime &&
      arrivalTime &&
      boardTime &&
      price
    ) {
      const flight = {
        aircraft_id: planeModel.value,
        arrival_airport: arrivalAirport.value,
        arrival_time: arrivalTime + ":00+07:00",
        board_time: boardTime + ":00+07:00",
        departure_airport: departureAirport.value,
        departure_time: departureTime + ":00+07:00",
        flight_number: flightNumber,
        gate: "A1",
        price: Number(price),
        status: "On time",
      };

      fetch("http://112.137.129.161:1803/api/v1/flights/withseats", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(flight),
      }).then((response) => {
        console.log(response);
        console.log(flight);
      });
    }
  }

  const handleFlightNumber = (e) => setFlightNumber(e.target.value);
  const handleDepartureAirport = (e) => setDepartureAirport(e);
  const handleArrivalAirport = (e) => setArrivalAirport(e);
  const handlePlaneModel = (e) => setPlaneModel(e);
  const handleDepartureTime = (e) => setDepartureTime(e.target.value);
  const handleArrivalTime = (e) => setArrivalTime(e.target.value);
  const handleBoardTime = (e) => setBoardTime(e.target.value);
  const handlePrice = (e) => setPrice(e.target.value);

  return (
    <form
      id="flight-form"
      className="max-w-lg mx-auto p-6 bg-white shadow-md rounded-lg border-2 border-grey-700"
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
          value={flightNumber}
          onChange={handleFlightNumber}
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
          required
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
          required
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
          required
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="boardTime"
          className="block text-sm font-medium text-gray-700"
        >
          Boarding Time:
        </label>
        <input
          type="datetime-local"
          id="boardTime"
          name="boardTime"
          required
          value={boardTime}
          onChange={handleBoardTime}
          min={formattedNow}
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
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
          value={departureTime}
          onChange={handleDepartureTime}
          min={boardTime}
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
          value={arrivalTime}
          onChange={handleArrivalTime}
          min={departureTime}
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="price"
          className="block text-sm font-medium text-gray-700"
        >
          Price:
        </label>
        <input
          type="number"
          id="price"
          name="price"
          placeholder="Price"
          value={price}
          onChange={handlePrice}
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <button
        type="submit"
        className="w-full text-white bg-blue-500 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 shadow-md focus:outline-none"
        onClick={handleSubmitFlight}
      >
        Create Flight
      </button>
    </form>
  );
}

export default NewFlightInputForm;
