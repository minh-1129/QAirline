import { type SortOption } from '@/types/SortOption'

interface SortBarProps {
  selected: SortOption
  onSort: (option: SortOption) => void
}

export function SortBar({ selected, onSort }: SortBarProps) {
  const options: { label: string; value: SortOption }[] = [
    { label: 'TRAVEL DURATION', value: 'TRAVEL_DURATION' },
    { label: 'PRICE', value: 'PRICE' },
    { label: 'ARRIVAL TIME', value: 'ARRIVAL_TIME' },
    { label: 'DEPARTURE TIME', value: 'DEPARTURE_TIME' }
  ]

  return (
    <div className="mb-6 flex items-center gap-4 border-b border-gray-200 pb-4">
      <span className="text-sm font-medium text-gray-600">SORT BY:</span>
      <div className="flex gap-6">
        {options.map((option) => (
          <button
            key={option.value}
            onClick={() => onSort(option.value)}
            className={`text-sm font-medium transition-colors ${
              selected === option.value
                ? 'text-[#f37a20] border-b-2 border-[#f37a20] pb-4 -mb-4'
                : 'text-gray-600 hover:text-gray-900'
            }`}
          >
            {option.label}
          </button>
        ))}
      </div>
    </div>
  )
}

