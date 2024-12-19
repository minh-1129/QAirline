import { Plane } from 'lucide-react'

interface RouteHeaderProps {
  from: {
    city: string
    code: string
    date: string
    day: string
  }
  to: {
    city: string
    code: string
    date: string
    day: string
  }
}

export function RouteHeader({ from, to }: RouteHeaderProps) {
  return (
    <div className="mb-8 border-b border-gray-200 pb-6">
      <div className="text-sm text-gray-500">One way</div>
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
    </div>
  )
}

