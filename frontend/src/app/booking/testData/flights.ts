import { Flight } from '../types/flight'

export const flights: Flight[] = [
  {
    aircraft_id: 1,
    arrival_airport: "SIN",
    arrival_time: "2024-01-10T06:00:00+08:00",
    board_time: "2024-01-09T08:40:00+00:00",
    departure_airport: "LHR",
    departure_time: "2024-01-09T09:10:00+00:00",
    flight_id: 305,
    flight_number: "SQ 305",
    gate: "A1",
    status: "On Time",
    price: 914.72
  },
  {
    aircraft_id: 2,
    arrival_airport: "SIN",
    arrival_time: "2024-01-10T07:45:00+08:00",
    board_time: "2024-01-09T10:25:00+00:00",
    departure_airport: "LHR",
    departure_time: "2024-01-09T10:55:00+00:00",
    flight_id: 317,
    flight_number: "SQ 317",
    gate: "B2",
    status: "On Time",
    price: 1038.72
  },
  {
    aircraft_id: 3,
    arrival_airport: "SIN",
    arrival_time: "2024-01-10T17:30:00+08:00",
    board_time: "2024-01-09T20:05:00+00:00",
    departure_airport: "LHR",
    departure_time: "2024-01-09T20:35:00+00:00",
    flight_id: 319,
    flight_number: "SQ 319",
    gate: "C3",
    status: "On Time",
    price: 914.72
  },
  {
    aircraft_id: 4,
    arrival_airport: "SIN",
    arrival_time: "2024-01-10T19:00:00+08:00",
    board_time: "2024-01-09T21:35:00+00:00",
    departure_airport: "LHR",
    departure_time: "2024-01-09T22:05:00+00:00",
    flight_id: 321,
    flight_number: "SQ 321",
    gate: "D4",
    status: "On Time",
    price: 914.72
  }
]

