
interface PriceColumnProps {
  type: 'economy' | 'premiumEconomy'
  price: {
    amount: number
    currency: string
    available: boolean
  }
  onSelect: () => void
  isSelected: boolean
}

export function PriceColumn({ type, price, onSelect, isSelected }: PriceColumnProps) {
  const bgColor = type === 'economy' ? 'bg-[#4a4a4a]' : 'bg-[#006341]'

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
            <div className="text-sm text-gray-600">{price.currency}</div>
            <div className="mt-1 text-xl font-bold text-gray-900">
              {price.amount.toFixed(2)}
            </div>
            <div className="text-sm text-gray-600">PER PERSON</div>
            <button 
              onClick={onSelect}
              className={`mt-2 flex w-full items-center justify-between rounded border px-3 py-1.5 text-sm font-medium transition-colors ${
                isSelected 
                  ? 'border-[#1b206e] bg-[#1b206e] text-white' 
                  : 'border-gray-300 text-gray-700 hover:bg-gray-50'
              }`}
            >
              {isSelected ? 'Selected' : 'Select'}
              
            </button>
          </>
        ) : (
          <div className="text-sm text-gray-500">Not applicable</div>
        )}
      </div>
    </div>
  )
}

