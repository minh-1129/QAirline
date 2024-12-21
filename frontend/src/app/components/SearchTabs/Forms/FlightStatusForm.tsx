"use client";
import { useState } from "react";
import LocationSelector from "./LocationSelector";
import { LocationProps, locationToString } from "../../../../types/location";
import { DateSelector } from "./DateSelector";
import { useRouter } from "next/navigation";
import { useToast } from "@/hooks/use-toast";
import axios from "axios";
type TripType = "one-way" | "round-trip";
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

  const router = useRouter();
  const { toast } = useToast();

  const handleSubmit = () => {
    const flightStatusSearchData = {
      fromLocation,
      toLocation,
      departureDate: departureDate?.toISOString(),
      returnDate: returnDate?.toISOString(),
    };

    sessionStorage.setItem(
      "flightStatusSearchData",
      JSON.stringify(flightStatusSearchData),
    );
    router.push("booking");
  };

  return (
    <div className="rounded-lg bg-white p-6 shadow-md">
      <h2 className="mb-6 text-2xl font-semibold text-[#1B3168]">
        Where would you like to go?
      </h2>
      <div className="mb-6 grid grid-cols-1 gap-4 lg:grid-cols-3">
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
        {/* <DateSelector
          label="Return date"
          value={returnDate}
          onChange={setReturnDate}
        /> */}
      </div>
      <div className="">
        <button
          onClick={handleSubmit}
          className="rounded bg-[#1B3168] px-4 py-2 text-white hover:bg-blue-600"
        >
          Submit
        </button>
      </div>
    </div>
  );
}
