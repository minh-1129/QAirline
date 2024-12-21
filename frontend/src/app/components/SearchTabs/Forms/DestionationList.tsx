import locationsData from "@/data/locations.json";
import {
  RegionProps,
  LocationProps,
  locationToString,
} from "../../../../types/location";

const allRegions: RegionProps[] = locationsData["regions"];

type DestinationListProps = {
  regionIndex: number;
  onSelectDestination: (destination: LocationProps) => void;
  otherValue?: string;
};

export default function DestinationList({
  regionIndex,
  onSelectDestination,
  otherValue,
}: DestinationListProps) {
  const locations = allRegions[regionIndex].destinations;
  return (
    <div className="no-scrollbar max-h-[400px] w-2/3 overflow-y-auto">
      {locations.map((dest) => {
        const formattedLocation = locationToString(dest);
        const isDisabled =
          formattedLocation.toLowerCase() === otherValue?.toLowerCase();

        return (
          <div
            key={dest.code}
            className={`px-4 py-3 text-sm ${
              isDisabled
                ? "cursor-not-allowed text-gray-400"
                : "cursor-pointer text-[#0C5B6D] hover:bg-gray-50"
            }`}
            onClick={() => !isDisabled && onSelectDestination(dest)}
          >
            {formattedLocation}
          </div>
        );
      })}
    </div>
  );
}
