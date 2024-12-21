import { type SortOption } from "@/types/SortOption"

interface SortControlProps {
  selected: SortOption
  onChange: (option: SortOption) => void
}

export function SortControl({ selected, onChange }: SortControlProps) {
  const options: { label: string; value: SortOption }[] = [
    { label: "Travel Duration", value: "TRAVEL_DURATION" },
    { label: "Price", value: "PRICE" },
    { label: "Arrival Time", value: "ARRIVAL_TIME" },
    { label: "Departure Time", value: "DEPARTURE_TIME" },
  ]

  return (
    <div className="flex items-center gap-4 border-b pb-4">
      <span className="text-sm font-medium">Sort by:</span>
      <div className="flex gap-2">
        {options.map((option) => (
          <button
            key={option.value}
            onClick={() => onChange(option.value)}
            className={`rounded-md px-4 py-2 text-sm transition-colors ${
              selected === option.value
                ? "bg-primary text-primary-foreground"
                : "hover:bg-muted"
            }`}
          >
            {option.label}
          </button>
        ))}
      </div>
    </div>
  )
}

