"use client";

import { useState, useEffect } from "react";
import { RouteHeader } from "@/app/booking/components/RouteHeader";
import { FlightList } from "@/app/booking/components/FlightList";
import { type SortOption } from "@/types/SortOption";
import { type Flight } from "@/types/flight";
import {type FlightSearchData} from "@/types/flightSearchData"
import {type LocationProps} from "@/types/location"
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";
import Header from "@/components/custom/Header";
export default function FlightSelectionPage() {
  const [departureSortBy, setDepartureSortBy] =
    useState<SortOption>("TRAVEL_DURATION");
  const [returnSortBy, setReturnSortBy] =
    useState<SortOption>("TRAVEL_DURATION");
  const [isRoundTrip, setIsRoundTrip] = useState(false);
  const [selectedDepartureFlight, setSelectedDepartureFlight] =
    useState<Flight | null>(null);
  const [selectedReturnFlight, setSelectedReturnFlight] =
    useState<Flight | null>(null);
  const [departureFlights, setDepartureFlights] = useState<Flight[]>([]);
  const [returnFlights, setReturnFlights] = useState<Flight[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [flightSearchData, setFlightSearchData] = useState<FlightSearchData>()
  useEffect(() => {
    async function fetchFlights() {
      try {
        setIsLoading(true);
        const savedIsRoundTrip = sessionStorage.getItem('isRoundTrip')
        if (savedIsRoundTrip) {
          setIsRoundTrip(JSON.parse(savedIsRoundTrip))
        }
        const savedFlightSearchData = sessionStorage.getItem('flightSearchData')
        if (!savedFlightSearchData) {
          return;
        }
        const flightSearchData: FlightSearchData = JSON.parse(savedFlightSearchData)
        const toCode = flightSearchData.toLocation.code;
        const fromCode = flightSearchData.fromLocation.code;
        const desiredDepartureDate = new Date(flightSearchData.departureDate);
        const desiredReturnDate = new Date(flightSearchData.returnDate);
        const thuanAPI = `http://112.137.129.161:1803/api/v1/flights/search?departure=${fromCode}&arrival=${toCode}`
        const nguocAPI = `http://112.137.129.161:1803/api/v1/flights/search?departure=${toCode}&arrival=${fromCode}`
        console.log(desiredReturnDate)
        const [departureResponse, returnResponse] = await Promise.all([
          fetch(thuanAPI),
          fetch(nguocAPI),
        ]);
        console.log(thuanAPI)
        if (!departureResponse.ok || !returnResponse.ok) {
          throw new Error("Failed to fetch flight data");
        }

        const [departures, returns]= await Promise.all([
          departureResponse.json(),
          returnResponse.json(),
        ]);
        const filteredDepartures = departures.filter((flight: Flight) => {
          const flightDepartureDate = new Date(flight.departure_time);
      
          return (
            flightDepartureDate.getUTCFullYear() !== desiredDepartureDate.getUTCFullYear() ||
            flightDepartureDate.getUTCMonth() !== desiredDepartureDate.getUTCMonth() ||
            flightDepartureDate.getUTCDate() !== desiredDepartureDate.getUTCDate()
          );
        });
        const filteredReturns = returns.filter((flight: Flight) => {
          const flightDepartureDate = new Date(flight.departure_time);
          
          return (
            flightDepartureDate.getUTCFullYear() !== desiredReturnDate.getUTCFullYear() ||
            flightDepartureDate.getUTCMonth() !== desiredReturnDate.getUTCMonth() ||
            flightDepartureDate.getUTCDate() !== desiredReturnDate.getUTCDate()
          );
        });
        setDepartureFlights(filteredDepartures);
        setReturnFlights(filteredReturns);
        setError(null);
      } catch (err) {
        console.error("Error fetching flights:", err);
        setError("Failed to fetch flight data. Please try again later.");
      } finally {
        setIsLoading(false);
      }
    }

    fetchFlights();
  }, []);

  const handleFlightSelect = (flight: Flight, type: "departure" | "return") => {
    if (type === "departure") {
      setSelectedDepartureFlight(flight);
    } else {
      setSelectedReturnFlight(flight);
    }
  };

  if (isLoading) {
    return (
      <div className="flex h-screen items-center justify-center">
        Loading...
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex h-screen flex-col items-center justify-center">
        <p className="mb-4 text-red-500">{error}</p>
        <button
          onClick={() => window.location.reload()}
          className="rounded bg-blue-500 px-4 py-2 text-white hover:bg-blue-600"
        >
          Retry
        </button>
      </div>
    );
  }

  return (
    <div>
      <div className="min-h-screen bg-white">
        <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8 ">
          <div className="mb-6 flex items-center justify-between">
            <h1 className="text-2xl font-bold text-[#1b206e]">
              Select Your Flight
            </h1>
            {/* <div className="flex items-center space-x-2">
              <Switch
                id="round-trip"
                checked={isRoundTrip}
                onCheckedChange={setIsRoundTrip}
              />
              <Label htmlFor="round-trip">Round Trip</Label>
            </div> */}
          </div>
        
      
          <FlightList
            flights={departureFlights}
            sortBy={departureSortBy}
            onSort={setDepartureSortBy}
            listType="departure"
            onSelectFlight={(flight) => handleFlightSelect(flight, "departure")}
            selectedFlight={selectedDepartureFlight}
          />

          {isRoundTrip && (
            <FlightList
              flights={returnFlights}
              sortBy={returnSortBy}
              onSort={setReturnSortBy}
              listType="return"
              onSelectFlight={(flight) => handleFlightSelect(flight, "return")}
              selectedFlight={selectedReturnFlight}
            />
          )}
        </div>
      </div>
    </div>
  );
}
