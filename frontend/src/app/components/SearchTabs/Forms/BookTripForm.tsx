"use client";
import { useState } from "react";
import LocationSelector from "./LocationSelector";
import { LocationProps,  locationToString } from "./types/location";
import { DateSelector } from "./DateSelector";
import { useRouter } from "next/navigation";

type LocationSelectorProps = {
  label: string;
  placeholder: string;
  value: LocationProps | null;
  otherValue?: string;
  onChange: (value: LocationProps | null) => void;
};

export default function BookTripForm() {
  const [fromLocation, setFromLocation] = useState<LocationProps>();
  const [toLocation, setToLocation] = useState<LocationProps>();
  const [returnDate, setReturnDate] = useState<Date | undefined>();
  const [departureDate, setDepartureDate] = useState<Date | undefined>();
  const [tripType, setTripType] = useState("one-way");

  const router = useRouter();




  const handleSubmit = async () => {
    const flightSearchData = {
      fromLocation,
      toLocation,
      departureDate: departureDate?.toISOString(),
      returnDate: returnDate?.toISOString(),
    }
    sessionStorage.setItem("flightSearchData", JSON.stringify(flightSearchData));
    
    router.push('/booking')

  };
  



  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-2xl font-semibold text-[#1B3168] mb-6">
        Where would you like to go?
      </h2>
      <div className="mb-6 grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-4">
        <LocationSelector
          label="From"
          placeholder="Select desination"
          value={fromLocation}
          onChange={setFromLocation}
          otherValue={locationToString(toLocation)}
        />
        <LocationSelector
          label="To"
          placeholder="Select destination"
          value={toLocation}
          onChange={setToLocation}
          otherValue={locationToString(fromLocation)}
        />
        <DateSelector
          label="Depart date"
          value={departureDate}
          onChange={setDepartureDate}
        />
        <DateSelector
          label="Return date"
          value={returnDate}
          onChange={setReturnDate}
        />
      </div>
      <button
        onClick={handleSubmit}
        className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
      >
        Submit
      </button>
    </div>
  );
}
