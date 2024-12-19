'use client'

import { useState, useMemo } from 'react'
import { RouteHeader } from './components/RouteHeader'
import { SortBar } from './components/SortBar'
import { FlightCard } from './components/FlightCard'
import { flights } from './testData/flights'
import { type Flight } from './types/flight'
import { type SortOption } from './types/SortOption'
export default function FlightSelectionPage() {
  const [sortBy, setSortBy] = useState<SortOption>('TRAVEL_DURATION')

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
  }, [sortBy])

  const handleSort = (option: SortOption) => {
    setSortBy(option)
  }

  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        
        <RouteHeader
          from={{
            city: 'London',
            code: 'LHR',
            date: '09 JAN',
            day: 'THU'
          }}
          to={{
            city: 'Singapore',
            code: 'SIN',
            date: '10 JAN',
            day: 'FRI'
          }}
        />
        
        <div className="mb-8">
          <div className="mb-6 flex items-center justify-between">
            <h1 className="text-2xl font-bold text-[#1b206e]">
              I. London to Singapore
            </h1>
            <div className="flex items-center gap-4">
              <div className="flex items-center gap-2">
                <span className="text-sm text-gray-600">
                  QAirlines
                </span>
              </div>
            </div>
          </div>
          
          <SortBar selected={sortBy} onSort={handleSort} />
          
          <div className="space-y-4">
            {sortedFlights.map((flight) => (
              <FlightCard key={flight.flight_id} flight={flight} />
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

