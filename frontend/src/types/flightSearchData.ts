import {LocationProps} from "./location"

export interface FlightSearchData {
    fromLocation: LocationProps
    toLocation: LocationProps
    departureDate: Date
    returnDate: Date
}