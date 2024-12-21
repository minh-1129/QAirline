import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";

interface FlightTimes {
  flightId: number;
  boardTime: string;
  departureTime: string;
  arrivalTime: string;
  aircraftId: number;
  arrivalAirport: string;
  departureAirport: string;
  flightNumber: string;
  price: number;
}

function EditFlight(props: FlightTimes) {
  const [newBoardTime, setNewBoardTime] = useState(props.boardTime);
  const [newDepartureTime, setNewDepartureTime] = useState(props.departureTime);
  const [newArrivalTime, setNewArrivalTime] = useState(props.arrivalTime);

  function handleNewBoardTime(e) {
    setNewBoardTime(e.target.value);
  }

  function handleNewDepartureTime(e) {
    setNewDepartureTime(e.target.value);
  }

  function handleNewArrivalTime(e) {
    setNewArrivalTime(e.target.value);
  }

  function handleDelayFlight() {
    if (newArrivalTime && newBoardTime && newDepartureTime) {
      const flight = {
        aircraft_id: props.flightId,
        arrival_airport: props.arrivalAirport,
        arrival_time: newArrivalTime + ":00+07:00",
        board_time: newBoardTime + ":00+07:00",
        departure_airport: props.departureAirport,
        departure_time: newDepartureTime + ":00+07:00",
        flight_number: props.flightNumber,
        gate: "A1",
        price: Number(props.price),
        status: "Delayed",
      };

      fetch(`http://112.137.129.161:1803/api/v1/flights/${props.flightId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(flight),
      }).then((response) => {
        console.log(response);
        window.location.reload();
      });
    }
  }

  return (
    <div
      className="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabIndex={-1}
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <h1 className="modal-title fs-5" id="staticBackdropLabel">
              Edit Flight
            </h1>
            <button
              type="button"
              className="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div className="modal-body">
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
                value={newBoardTime}
                onChange={handleNewBoardTime}
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
                value={newDepartureTime}
                onChange={handleNewDepartureTime}
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
                value={newArrivalTime}
                onChange={handleNewArrivalTime}
                className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
              />
            </div>
          </div>
          <div className="modal-footer">
            <button
              type="button"
              className="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button
              type="button"
              className="btn btn-primary"
              onClick={handleDelayFlight}
            >
              Update
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default EditFlight;
