import locationsData from '@/data/locations.json'
import { LocationProps, RegionProps, locationToString } from "./types/location";

const allRegions: RegionProps[] = locationsData["regions"];

type DestinationListProps = {
  regionIndex: number
  onSelectDestination: (destination: { city: string; code: string; country: string }) => void
  otherValue?: string
}

export default function DestinationList({ regionIndex, onSelectDestination, otherValue }: DestinationListProps) {
  const locations = allRegions[regionIndex].destinations
  return (
    <div className="w-2/3 max-h-[400px] overflow-y-auto no-scrollbar">
      {locations.map((dest) => {
        const formattedLocation = locationToString(dest)
        const isDisabled = formattedLocation.toLowerCase() === otherValue?.toLowerCase()

        return (
          <div
            key={dest.code}
            className={`px-4 py-3 text-sm ${
              isDisabled 
                ? 'text-gray-400 cursor-not-allowed'
                : 'text-[#0C5B6D] cursor-pointer hover:bg-gray-50'
            }`}
            onClick={() => !isDisabled && onSelectDestination(dest)}
          >
            {formattedLocation}
          </div>
        )
      })}
    </div>
  )
}

