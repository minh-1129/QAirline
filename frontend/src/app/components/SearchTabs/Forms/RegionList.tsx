import locationsData from '@/data/locations.json'
import { LocationProps, RegionProps, locationToString } from "./types/location";

const allRegions: RegionProps[] = locationsData["regions"];

const allLocations: LocationProps[] = locationsData["regions"].flatMap(
  (region) => region.destinations,
);

type RegionListProps = {
  onSelectRegion: (regionIndex: number) => void
  selectedRegion: number
  setShowDropDown: (value: boolean) => void
}

export function RegionList({ onSelectRegion, selectedRegion, setShowDropDown}: RegionListProps) {
  return (
    <div className="w-1/3 bg-[#0C5B6D] text-white font-medium ">
      {allRegions.map((region, index) => (
        <div
          key={region.name}
          className={`px-4 py-3 cursor-pointer text-xs tracking-wide ${
            selectedRegion === index 
              ? 'bg-[#0A4F5F]' 
              : 'hover:bg-[#0A4F5F] transition-colors'
          }`}
          onClick={() => {onSelectRegion(index); setShowDropDown(true);}}
        >
          {region.name}
        </div>
      ))}
    </div>
  )
}

