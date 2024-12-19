import { ChevronDown } from 'lucide-react'

interface PriceColumnProps {
  type: 'economy' | 'premiumEconomy'
  price: {
    amount: number
    currency: string
    available: boolean
  }
}

export function PriceColumn({ type, price }: PriceColumnProps) {
  const bgColor = type === 'economy' ? 'bg-[#006341]' : 'bg-[#4a4a4a]'
  
  return (
    <div className="w-[200px]">
      <div className={`${bgColor} px-4 py-2 text-white`}>
        <div className="text-sm font-medium">
          {type === 'economy' ? 'ECONOMY' : 'PREMIUM ECONOMY'}
        </div>
      </div>
      <div className="border-x border-b border-gray-200 px-4 py-3">
        {price.available ? (
          <>
            <div className="text-sm text-gray-600">FROM {price.currency}</div>
            <div className="mt-1 text-xl font-bold text-gray-900">
              {price.amount.toFixed(2)}
            </div>
            <div className="text-sm text-gray-600">PER ADULT</div>
            <button className="mt-2 flex w-full items-center justify-between rounded border border-gray-300 px-3 py-1.5 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50">
              Select
            </button>
          </>
        ) : (
          <div className="text-sm text-gray-500">Not applicable</div>
        )}
      </div>
    </div>
  )
}

