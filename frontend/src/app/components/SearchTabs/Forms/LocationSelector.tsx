"use client";

import { useState, useEffect, useRef } from "react";
import { LocationProps, RegionProps, locationToString } from "./types/location";
import locationsData from "@/data/locations.json";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { X } from "lucide-react";
import { RegionList } from "./RegionList";
import DestinationList from "./DestionationList";

type LocationSelectorProps = {
  label: string;
  placeholder: string;
  value: LocationProps | undefined;
  otherValue?: string;
  onChange: (value: LocationProps | undefined) => void;
};
const allRegions: RegionProps[] = locationsData["regions"];

const allLocations: LocationProps[] = locationsData["regions"].flatMap(
  (region) => region.destinations,
);

export default function LocationSelector({
  label,
  placeholder,
  value,
  otherValue,
  onChange,
}: LocationSelectorProps) {
  const [inputValue, setInputValue] = useState<LocationProps | null>(null);
  const [inputString, setInputString] = useState("");
  const [showDropdown, setShowDropdown] = useState(false);
  const [filteredLocations, setFilteredLocations] = useState<LocationProps[]>(
    [],
  );
  const inputRef = useRef<HTMLInputElement>(null);
  const [selectedRegion, setSelectedRegion] = useState(0);
  const componentRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleOutsideClick = (event: MouseEvent) => {
      if (
        componentRef.current &&
        !componentRef.current.contains(event.target as Node)
      ) {
        setShowDropdown(false);
      }
    };

    document.addEventListener("mousedown", handleOutsideClick);
    return () => {
      document.removeEventListener("mousedown", handleOutsideClick);
    };
  }, []);
  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value;
    setInputString(newValue);
    setShowDropdown(true);
    if (inputString) {
      const filtered = allLocations.filter((location) => {
        const searchStr = inputString.toLowerCase();
        return (
          location.city.toLowerCase().includes(searchStr) ||
          location.code.toLowerCase().includes(searchStr) ||
          location.country.toLowerCase().includes(searchStr)
        );
      });
      setFilteredLocations(filtered);
    } else {
      setFilteredLocations([]);
    }
  };

  const handleLocationSelect = (location: LocationProps) => {
    setInputString(locationToString(location));
    onChange(location);
    setShowDropdown(false);
  };

  return (
    <div className="relative" ref={componentRef}>
      <Label className="absolute -top-2 left-2 z-10 bg-white px-1 text-xs text-gray-500">
        {label}
      </Label>
      <div className="relative">
        <Input
          ref={inputRef}
          value={inputString}
          onChange={handleInputChange}
          onFocus={() => setShowDropdown(true)}
          placeholder={placeholder}
          className="h-12 pr-8"
        />
        {inputString && (
          <button
            onClick={() => {
              setInputString("");
              onChange(undefined);
              inputRef.current?.focus();
            }}
            className="absolute right-2 top-1/2 -translate-y-1/2"
          >
            <X className="h-4 w-4 text-gray-400" />
          </button>
        )}
      </div>
      {showDropdown && (
        <div className="no-scrollbar absolute z-50 mt-1 max-h-80 w-full overflow-y-auto rounded-md border bg-white shadow-lg">
          {inputString === "" ? (
            <div className="flex">
              <RegionList
                onSelectRegion={setSelectedRegion}
                selectedRegion={selectedRegion}
                setShowDropDown={setShowDropdown}
              />
              <DestinationList
                regionIndex={selectedRegion}
                onSelectDestination={handleLocationSelect}
                otherValue={otherValue}
              />
            </div>
          ) : (
            filteredLocations.map((location) => {
              const formattedLocation = locationToString(location);
              const isDisabled =
                formattedLocation.toLowerCase() === otherValue?.toLowerCase();
              return (
                <div
                  key={location.code}
                  className={`px-4 py-2 text-sm hover:bg-gray-100${
                    isDisabled
                      ? "cursor-not-allowed text-gray-400"
                      : "cursor-pointer text-[#0C5B6D] hover:bg-gray-50"
                  }`}
                  onClick={() => !isDisabled && handleLocationSelect(location)}
                >
                  {locationToString(location)}
                </div>
              );
            })
          )}
        </div>
      )}
    </div>
  );
}
