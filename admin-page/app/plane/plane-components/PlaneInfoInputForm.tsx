"use client";
import React, { useState } from "react";

function PlaneInfoInputForm() {
  const [planeManufacturer, setPlaneManufacturer] = useState("");
  const [planeName, setPlaneName] = useState("");
  const [capacity, setCapacity] = useState();

  function handlePlaneManufacturer(e) {
    setPlaneManufacturer(e.target.value);
  }

  function handlePlaneName(e) {
    setPlaneName(e.target.value);
  }

  function handleCapacity(e) {
    setCapacity(e.target.value);
  }

  function handleSubmitPlane(e) {
    //e.preventDefault();
    if (planeManufacturer && planeName && capacity) {
      const plane = {
        aircraft_manufacturer: planeManufacturer,
        aircraft_name: planeName,
        aircraft_type: "string",
        capacity: Number(capacity),
      };
  
      fetch("http://112.137.129.161:1803/api/v1/aircrafts", {
        method: "POST",
        headers: {
          accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(plane),
      }).then((response) => {
        console.log("new plane added");
        console.log(response);
      });
    }
  }

  return (
    <form className="max-w-lg mx-auto bg-white shadow-lg rounded-lg p-6 space-y-6">
      <h2 className="text-2xl font-semibold mb-6 text-gray-800">
        New Flight Information
      </h2>

      <div className="mb-4">
        <label
          htmlFor="flightNumber"
          className="block text-sm font-medium text-gray-700"
        >
          Manufacturer:
        </label>
        <input
          type="text"
          id="manufacturer"
          name="manufacturer"
          placeholder="Enter manufacturer"
          value={planeManufacturer}
          onChange={handlePlaneManufacturer}
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="name"
          className="block text-sm font-medium text-gray-700"
        >
          Plane Name:
        </label>
        <input
          type="text"
          id="name"
          name="name"
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          placeholder="Enter Plane Name"
          value={planeName}
          required
          onChange={handlePlaneName}
        />
      </div>

      <div>
        <label
          htmlFor="capacity"
          className="block text-sm font-medium text-gray-700"
        >
          Capacity:
        </label>
        <input
          type="number"
          id="capacity"
          name="capacity"
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          placeholder="Enter Capacity"
          required
          value={capacity}
          onChange={handleCapacity}
        />
      </div>

      <div className="text-right">
        <button
          type="submit"
          className="w-full text-white bg-blue-500 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 shadow-md focus:outline-none"
          onClick={handleSubmitPlane}
        >
          Submit Plane Information
        </button>
      </div>
    </form>
  );
}

export default PlaneInfoInputForm;
