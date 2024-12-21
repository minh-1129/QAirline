'use client'

import { Plane } from 'lucide-react'
import { type Flight } from '@/types/flight'
import { PriceColumn } from './PriceColumn'
import codeToCity from '@/data/codeToCity.json'
import {formatDate, formatTime} from "@/utils/formatDate"
interface FlightCardProps {
  flight: Flight
  listType: 'departure' | 'return'
  onSelect: () => void
  isSelected: boolean
}

export function FlightCard({ flight, listType, onSelect, isSelected }: FlightCardProps) {
  const departureDate = new Date(flight.departure_time)
  const arrivalDate = new Date(flight.arrival_time)
  const durationMs = arrivalDate.getTime() - departureDate.getTime()
  const durationHours = Math.floor(durationMs / (1000 * 60 * 60))
  const durationMinutes = Math.round((durationMs % (1000 * 60 * 60)) / (1000 * 60))
  const durationString = `${durationHours}hrs ${durationMinutes}mins`
  const mapCodeToCity : {
    [code: string]: string; // Generic map of string keys to string values
  } = codeToCity 

  return (
    <div className={`mb-4 rounded border ${isSelected ? 'border-[#1b206e] bg-blue-50' : 'border-gray-200'}`}>
      <div className="flex items-start justify-between p-6">
        <div className="flex-1">
          <div className="text-sm text-gray-600">Non-stop • {durationString}</div>
          <div className="mt-4 flex items-center gap-8">
            <div>
              <div className="text-2xl font-semibold text-[#1b206e]">
                {flight.departure_airport} {formatTime(departureDate)}
              </div>
              <div className="mt-1 text-sm text-gray-600">
                {mapCodeToCity[flight.departure_airport]} • {formatDate(departureDate)}
              </div>
            </div>
            <div className="flex flex-col items-center">
              <div className="relative w-32">
                <div className="absolute inset-0 flex items-center">
                  <div className="w-full border-t border-gray-300"></div>
                </div>
                <div className="relative flex justify-center">
                  <Plane className="h-4 w-4 rotate-90 bg-white text-gray-400" />
                </div>
              </div>
            </div>
            <div>
              <div className="text-2xl font-semibold text-[#1b206e]">
                {flight.arrival_airport} {formatTime(arrivalDate)}
              </div>
              <div className="mt-1 text-sm text-gray-600">
                {mapCodeToCity[flight.arrival_airport]} • {formatDate(arrivalDate)}
              </div>
            </div>
          </div>
          <div className="mt-4 flex items-center gap-2">
            <div className="flex items-center gap-2 text-sm text-gray-600">
              <span>QAirlines • {flight.flight_number}</span>
            </div>
          </div>
        </div>
        <div className="flex">
          <PriceColumn 
            type="economy" 
            price={{amount: flight.price, currency: 'USD', available: true}}
            onSelect={onSelect}
            isSelected={isSelected}
          />
        </div>
      </div>
    </div>
  )
}

