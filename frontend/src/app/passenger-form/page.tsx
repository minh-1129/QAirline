'use client'

import { zodResolver } from "@hookform/resolvers/zod"
import { Plane } from 'lucide-react'
import { useForm } from "react-hook-form"
import * as z from "zod"
import Link from 'next/link'
import axios from "axios"
import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

const formSchema = z.object({
  citizenId: z.string().length(12, "Citizen ID must be exactly 12 digits").regex(/^\d+$/, "Must contain only numbers"),
  firstName: z.string().min(2, "First name must be at least 2 characters"),
  lastName: z.string().min(2, "Last name must be at least 2 characters"),
  email: z.string().email("Invalid email address"),
  phoneNumber: z.string().length(10, "Phone number must be exactly 10 digits").regex(/^\d+$/, "Must contain only numbers"),
  dateOfBirth: z.string().refine((value) => {
    const regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d$/;
    if (!regex.test(value)) return false;
    const [day, month, year] = value.split('/').map(Number);
    const date = new Date(year, month - 1, day);
    const age = new Date().getFullYear() - year;
    return date.getDate() === day && date.getMonth() === month - 1 && date.getFullYear() === year && age >= 0 && age <= 120;
  }, "Invalid date of birth (DD/MM/YYYY)"),
  gender: z.enum(["male", "female", "other"], {
    required_error: "Please select a gender",
  }),
})

export default function PassengerForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      citizenId: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      dateOfBirth: '',
      gender: undefined
    }
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    const postData = async () => {
        const url = "http://112.137.129.161:1803/api/v1/passengers";
        const data = {
              "booking_id": 0,
              "citizen_id": {
                "string": "string",
                "valid": true
              },
              "dob": "string",
              "email": {
                "string": "string",
                "valid": true
              },
              "first_name": "string",
              "gender": "string",
              "last_name": "string",
              "passenger_id": 0,
              "phone_number": {
                "string": "string",
                "valid": true
              },
              "seat_id": 0
            }
          
    
        try {
          // const response = await axios.delete(url, data, {
          //   headers: {
          //     "Content-Type": "application/json",
          //   },
          // });
          const response = await axios.post(url, JSON.stringify(data))
          console.log(response.data);
        } catch (error) {
          console.error("Error making  request:", error);
        }
      };
    postData()
    console.log(values)
  }

  return (
    <div className="min-h-screen relative flex items-center justify-center p-4 overflow-hidden bg-[#001830]">

      
      {/* decorations*/}
      <div className="absolute inset-0 bg-gradient-to-br from-[#003876]/80 via-transparent to-transparent" />
      <div className="absolute bottom-0 left-0 w-96 h-96 bg-[#003876]/10 rounded-full blur-3xl transform -translate-x-1/2 translate-y-1/2" />

      <Link href="/booking" className="absolute top-4 left-4">
        <Button variant="outline" className="bg-white/10 text-[#C4B18D] border-[#C4B18D]/20 hover:bg-white/20 hover:text-white">
          Back to flights
        </Button>
      </Link>

      <div className="relative w-full max-w-2xl mx-auto">
        {/* Header Section */}
        <div className="mb-6 text-center">
          <div className="inline-flex items-center justify-center w-16 h-16 mb-4 rounded-full bg-gradient-to-br from-[#003876] to-[#002855]">
            <Plane className="w-8 h-8 text-[#C4B18D]" />
          </div>
          <h1 className="text-3xl font-bold text-white mb-2">Passenger Information</h1>
          <p className="text-[#C4B18D]/80">Please fill in your details below</p>
        </div>

        {/* Main Form */}
        <div className="backdrop-blur-xl bg-white/10 rounded-2xl border border-white/10 shadow-2xl">
          <div className="p-8">
            <Form {...form}>
              <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
                {/* Name Fields */}
                <div className="grid grid-cols-2 gap-6">
                  <FormField
                    control={form.control}
                    name="firstName"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">First Name</FormLabel>
                        <FormControl>
                          <Input 
                            placeholder="Minh" 
                            {...field} 
                            className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                          />
                        </FormControl>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                  <FormField
                    control={form.control}
                    name="lastName"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">Last Name</FormLabel>
                        <FormControl>
                          <Input 
                            placeholder="Pham" 
                            {...field} 
                            className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                          />
                        </FormControl>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                </div>

                {/* ID Field */}
                <FormField
                  control={form.control}
                  name="citizenId"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-[#C4B18D]">Citizen ID</FormLabel>
                      <FormControl>
                        <Input 
                          placeholder="123456789012" 
                          {...field} 
                          className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                        />
                      </FormControl>
                      <FormMessage className="text-[#C4B18D]" />
                    </FormItem>
                  )}
                />

                {/* Contact Fields */}
                <div className="grid grid-cols-2 gap-6">
                  <FormField
                    control={form.control}
                    name="email"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">Email</FormLabel>
                        <FormControl>
                          <Input 
                            placeholder="random@example.com" 
                            {...field} 
                            className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                          />
                        </FormControl>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                  <FormField
                    control={form.control}
                    name="phoneNumber"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">Phone Number</FormLabel>
                        <FormControl>
                          <Input 
                            placeholder="1234567890" 
                            {...field} 
                            className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                          />
                        </FormControl>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                </div>

                {/* Date and Gender Fields */}
                <div className="grid grid-cols-2 gap-6">
                  <FormField
                    control={form.control}
                    name="dateOfBirth"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">Date of Birth</FormLabel>
                        <FormControl>
                          <Input 
                            type="text"
                            placeholder="DD/MM/YYYY" 
                            {...field} 
                            className="bg-white/5 border-[#C4B18D]/20 text-white placeholder:text-white/50" 
                          />
                        </FormControl>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                  <FormField
                    control={form.control}
                    name="gender"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">Gender</FormLabel>
                        <Select onValueChange={field.onChange} value={field.value}>
                          <FormControl>
                            <SelectTrigger className="bg-white/5 border-[#C4B18D]/20 text-white hover:bg-white/10 focus:bg-white/10">
                              <SelectValue placeholder="Select gender" />
                            </SelectTrigger>
                          </FormControl>
                          <SelectContent className="bg-[#003876] text-white border-[#C4B18D]/20">
                            <SelectItem value="male">Male</SelectItem>
                            <SelectItem value="female">Female</SelectItem>
                            <SelectItem value="other">Other</SelectItem>
                          </SelectContent>
                        </Select>
                        <FormMessage className="text-[#C4B18D]" />
                      </FormItem>
                    )}
                  />
                </div>

                {/* Submit Button */}
                <Button 
                  type="submit" 
                  className="w-full bg-[#C4B18D] text-[#003876] font-bold hover:bg-[#A39066]"
                >
                  Submit Information
                </Button>
              </form>
            </Form>
          </div>
        </div>
      </div>
    </div>
  )
}

