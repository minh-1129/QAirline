'use client'

import { useMemo } from 'react'
import { FlightCard } from './FlightCard'
import { SortBar } from './SortBar'
import { type Flight } from '@/types/flight'
import {type SortOption } from "@/types/SortOption"

interface FlightListProps {
  flights: Flight[]
  sortBy: SortOption
  onSort: (option: SortOption) => void
  listType: 'departure' | 'return'
  onSelectFlight: (flight: Flight) => void
  selectedFlight: Flight | null
}

export function FlightList({ flights, sortBy, onSort, listType, onSelectFlight, selectedFlight }: FlightListProps) {
  const sortedFlights = useMemo(() => {
    return [...flights].sort((a, b) => {
      const getDate = (dateString: string) => new Date(dateString)
      
      switch (sortBy) {
        case 'TRAVEL_DURATION':
          const durationA = getDate(a.arrival_time).getTime() - getDate(a.departure_time).getTime()
          const durationB = getDate(b.arrival_time).getTime() - getDate(b.departure_time).getTime()
          return durationA - durationB
        case 'PRICE':
          return a.price - b.price
        case 'ARRIVAL_TIME':
          return getDate(a.arrival_time).getTime() - getDate(b.arrival_time).getTime()
        case 'DEPARTURE_TIME':
          return getDate(a.departure_time).getTime() - getDate(b.departure_time).getTime()
        default:
          return 0
      }
    })
  }, [flights, sortBy])

  return (
    <div className="mb-8">
      <div className="mb-6 flex items-center justify-between">
        <h2 className="text-2xl font-bold text-[#1b206e]">
          {listType === 'departure' ? 'Departure Flight' : 'Return Flight'}
        </h2>
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2">
            <span className="text-sm text-gray-600">
              QAirline
            </span>
          </div>
        </div>
      </div>
      
      <SortBar selected={sortBy} onSort={onSort} />
      
      <div className="space-y-4">
        {sortedFlights.map((flight) => (
          <FlightCard 
            key={flight.flight_id} 
            flight={flight} 
            listType={listType}
            onSelect={() => onSelectFlight(flight)}
            isSelected={selectedFlight?.flight_id === flight.flight_id}
          />
        ))}
      </div>
    </div>
  )
}

