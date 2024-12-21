"use client";
import dayjs from "dayjs";
import React, { useEffect, useState } from "react";
import Image from "next/image";
import planeSymbol from "../../images/black-plane.png";
import EditFlight from "./EditFlight";

interface FlightDetails {
  flight_id: number;
  aircraftId: number;
  arrivalAirport: string;
  arrivalTime: string;
  boardTime: string;
  departureAirport: string;
  departureTime: string;
  flightNumber: string;
  gate: string;
  status: string;
  price: number;
  airportsList;
  handleRemoveFlight: (flightId) => void;
}

function FlightCard(props: FlightDetails) {
  function formatTime(date: string, format: string) {
    return dayjs(date).format(format);
  }

  function getFlightDurationMins(props: FlightDetails) {
    const arrTime = new Date(props.arrivalTime).getTime();
    const depTime = new Date(props.departureTime).getTime();
    const flightDuration = Math.round((arrTime - depTime) / 60000);

    return flightDuration;
  }

  function formatFlightDuration(props: FlightDetails) {
    const flightDurationMins = getFlightDurationMins(props);
    const mins = flightDurationMins % 60;
    const hours = (flightDurationMins - mins) / 60;

    return `${hours}hrs ${mins}mins`;
  }

  function findCityNameFromIataCode(airportCode: String) {
    for (let i = 0; i < props.airportsList.length; i++) {
      if (props.airportsList[i].iata === airportCode) {
        return props.airportsList[i].city;
      }
    }
  }

  const [planeModel, setPlaneModel] = useState("");

  const fetchPlaneFromId = async () => {
    try {
      const response = await fetch(
        `http://112.137.129.161:1803/api/v1/aircrafts/${props.aircraftId}`
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();
      setPlaneModel(`${result.aircraft_manufacturer} ${result.aircraft_name}`);
    } catch (err) {
      console.log(err.message);
    }
  };

  useEffect(() => {
    fetchPlaneFromId();
  }, []);

  const departureCity = findCityNameFromIataCode(props.departureAirport);
  const arrivalCity = findCityNameFromIataCode(props.arrivalAirport);

  return (
    <div className="border rounded-lg border-gray-400 flex-row pl-5 mb-5">
      <p className="flight-time mb-3 font-semibold">
        Flight Time &#183; {formatFlightDuration(props)}
      </p>
      <div className="flight-info grid grid-cols-[3fr_1fr_1fr]">
        <div className="airports-info grid grid-cols-[2fr_1fr_2fr]">
          <div className="departure-info">
            <p className="departure-time text-2xl font-bold">
              {props.departureAirport}{" "}
              {formatTime(props.departureTime, "HH:mm")}
            </p>
            <p className="city">{departureCity}</p>
            <p className="date">
              {formatTime(props.departureTime, "dddd, D MMM")}
            </p>
          </div>

          <div className="plane-image">
            <Image
              src={planeSymbol}
              alt="Plane Symbol"
              width={50}
              height={50}
            />
          </div>

          <div className="arrival-info">
            <p className="arrival-time text-2xl font-bold">
              {props.arrivalAirport} {formatTime(props.arrivalTime, "HH:mm")}
            </p>
            <p className="city">{arrivalCity}</p>
            <p className="date">
              {formatTime(props.arrivalTime, "dddd, D MMM")}
            </p>
          </div>
        </div>

        <div className="other-info">
          <p className="brand-name text-xl font-semibold">QAirline</p>
          <p className="flight-number">{props.flightNumber}</p>
          <p className="aircraft-name">{planeModel}</p>
        </div>

        <div className="flight-actions">
          <div className="flex flex-col gap-4">
            <button
              className="w-3/4 text-white bg-red-600 hover:bg-red-700 active:bg-red-800 font-medium rounded-lg text-sm px-1 py-2.5 me-2 mb-2"
              onClick={() => props.handleRemoveFlight(props.flight_id)}
            >
              Remove
            </button>
            <button
              className="w-3/4 text-white bg-yellow-400 hover:bg-yellow-500 active:bg-yellow-600 font-medium rounded-lg text-sm px-1 py-2.5 me-2 mb-2"
              data-bs-toggle="modal"
              data-bs-target="#staticBackdrop"
            >
              Edit
            </button>
            <EditFlight
              flightId={props.flight_id}
              boardTime={props.boardTime}
              departureTime={props.departureTime}
              arrivalTime={props.arrivalTime}
              aircraftId={props.aircraftId}
              departureAirport={props.departureAirport}
              arrivalAirport={props.arrivalAirport}
              price={props.price}
              flightNumber={props.flightNumber}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default FlightCard;
