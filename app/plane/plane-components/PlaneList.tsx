"use client";
import React, { useEffect, useState } from "react";
import PlaneCard from "./PlaneCard";

function PlaneList() {
  const [planesList, setPlanesList] = useState([]);

  const fetchPlanes = async () => {
    try {
      const response = await fetch(
        "http://112.137.129.161:1803/api/v1/aircrafts"
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();
      setPlanesList(result);
      
    } catch (err) {
      console.log(err.message);
    }
  };

  useEffect(() => {
    fetchPlanes();
  }, []);

  return (
    <div className="plane-grid grid grid-cols-2 gap-4 mr-8">
      {planesList.map((plane) => (
        <PlaneCard
          manufacturer={plane.aircraft_manufacturer}
          name={plane.aircraft_name}
          capacity={plane.capacity}
        />
      ))}
    </div>
  );
}

export default PlaneList;
