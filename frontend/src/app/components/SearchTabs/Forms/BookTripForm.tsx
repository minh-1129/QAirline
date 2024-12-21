"use client";
import { useState } from "react";
import LocationSelector from "./LocationSelector";
import { LocationProps, locationToString } from "../../../../types/location";
import { DateSelector } from "./DateSelector";
import { useRouter } from "next/navigation";
import { useToast } from "@/hooks/use-toast";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
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
  const [tripType, setTripType] = useState<TripType>("one-way");

  const router = useRouter();
  const { toast } = useToast();



  const validateSearchData = (): string => {
    if (!fromLocation) {
      return "From location is required.";
    }
    if (!toLocation) {
      return "To location is required.";
    }
    if (!departureDate) {
      return "Departure date is required.";
    }
    if (tripType == "round-trip") {
      if (!returnDate) {
        return "Return date is required for round trip"
      }
      if (returnDate < departureDate) {
        return "Invalid dates"
      }
    }
    
    return "";
  };

  const handleSubmit = () => {
    console.log(departureDate?.toISOString())
    const flightSearchData = {
      fromLocation,
      toLocation,
      departureDate: departureDate?.toISOString(),
      returnDate: returnDate?.toISOString(),
    };

    const error = validateSearchData();
    if (error != "") {
      toast({
        title: "Validation error",
        description: error,
        variant: "destructive",
      });
      return;
    }

    sessionStorage.setItem(
      "flightSearchData",
      JSON.stringify(flightSearchData),
    );
    sessionStorage.setItem("isRoundTrip", JSON.stringify(tripType === "round-trip"));
    router.push("booking");
  };

  return (
    <div className="rounded-lg bg-white p-6 shadow-md">
      <h2 className="mb-6 text-2xl font-semibold text-[#1B3168]">
        Where would you like to go?
      </h2>
      {/* Chọn loại chuyến đi */}
      <RadioGroup
        defaultValue="one-way"
        className="mb-4 flex space-x-4 text-[#1B3168]"
        onValueChange={(value) => setTripType(value as TripType)}
      >

        <div className="flex items-center space-x-2">
          <RadioGroupItem
            value="one-way"
            id="one-way"
            className="checked:bg-[#1B3168]"
          />
          <Label htmlFor="one-way">One-way</Label>
        </div>
        <div className="flex items-center space-x-2">
          <RadioGroupItem
            value="round-trip"
            id="round-trip"
            className="checked:bg-[#1B3168]"
          />
          <Label htmlFor="round-trip">Round-trip</Label>
        </div>
      </RadioGroup>

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
          onChange={(newDate) => setDepartureDate(newDate)}
        />
        {tripType === "round-trip" && (
          <DateSelector
            label="Return date"
            value={returnDate}
            onChange={(newDate) => setReturnDate(newDate)}
          />
        )}
      </div>
      <div className="flex justify-center">
        <button
          onClick={handleSubmit}
          className="rounded bg-[#1B3168] px-4 py-2 text-white hover:bg-blue-600"
        >
          Search
        </button>
      </div>
    </div>
  );
}
