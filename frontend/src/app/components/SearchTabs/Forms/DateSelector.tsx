"use client"

import { useState } from "react"
import { Calendar } from "@/components/ui/calendar"
import { Label } from "@/components/ui/label"
import { format } from "date-fns"
import { CalendarIcon } from 'lucide-react'
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { Button } from "@/components/ui/button"

type DateSelectorProps = {
  label: string
  value: Date | undefined
  onChange: (date: Date | undefined) => void
}

export function DateSelector({ label, value, onChange }: DateSelectorProps) {
  const [open, setOpen] = useState(false)

  return (
    <div className="relative">
      <Label className="absolute -top-2 left-2 bg-white px-1 text-xs text-gray-500 z-10">
        {label}
      </Label>
      <Popover open={open} onOpenChange={setOpen}>
        <PopoverTrigger asChild>
          <Button
            variant="outline"
            className={`w-full justify-start text-left font-normal ${!value && "text-muted-foreground"}`}
          >
            <CalendarIcon className="mr-2 h-4 w-4" />
            {value ? format(value, "dd/MM/yyyy") : <span>Chọn ngày</span>}
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-auto p-0" align="start">
          <Calendar
            mode="single"
            selected={value}
            onSelect={(newDate) => {
              if (newDate) {
                onChange(newDate);
                setOpen(false);
              }
            }}
            initialFocus
          />
        </PopoverContent>
      </Popover>
    </div>
  )
}

