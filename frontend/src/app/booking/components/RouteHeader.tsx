import { Plane } from 'lucide-react'

interface RouteInfo {
  city: string
  code: string
  date: string
  day: string
}

interface RouteHeaderProps {
  from: RouteInfo
  to: RouteInfo
  returnFrom?: RouteInfo
  returnTo?: RouteInfo
  isRoundTrip: boolean
}

export function RouteHeader({ from, to, returnFrom, returnTo, isRoundTrip }: RouteHeaderProps) {
  return (
    <div className="mb-8 border-b border-gray-200 pb-6 ">
      <div className="text-sm text-gray-500">{isRoundTrip ? 'Round trip' : 'One way'}</div>
      <div className="mt-4 flex items-center justify-between">
        <div>
          <div className="text-sm text-gray-600">
            {from.date} ({from.day})
          </div>
          <div className="mt-1 text-lg font-semibold text-[#1b206e]">
            {from.city} ({from.code})
          </div>
        </div>
        <Plane className="h-5 w-5 text-[#1b206e]" />
        <div className="text-right">
          <div className="text-sm text-gray-600">
            {to.date} ({to.day})
          </div>
          <div className="mt-1 text-lg font-semibold text-[#1b206e]">
            {to.city} ({to.code})
          </div>
        </div>
      </div>
      {isRoundTrip && returnFrom && returnTo && (
        <div className="mt-4 flex items-center justify-between">
          <div>
            <div className="text-sm text-gray-600">
              {returnFrom.date} ({returnFrom.day})
            </div>
            <div className="mt-1 text-lg font-semibold text-[#1b206e]">
              {returnFrom.city} ({returnFrom.code})
            </div>
          </div>
          <Plane className="h-5 w-5 rotate-180 text-[#1b206e]" />
          <div className="text-right">
            <div className="text-sm text-gray-600">
              {returnTo.date} ({returnTo.day})
            </div>
            <div className="mt-1 text-lg font-semibold text-[#1b206e]">
              {returnTo.city} ({returnTo.code})
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

