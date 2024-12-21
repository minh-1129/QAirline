"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { Plane } from "lucide-react";
import { useForm } from "react-hook-form";
import * as z from "zod";
import Link from "next/link";
import axios from "axios";
import { Button } from "@/components/ui/button";
import { Flight } from "@/types/flight";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

const formSchema = z.object({
  citizenId: z
    .string()
    .length(12, "Citizen ID must be exactly 12 digits")
    .regex(/^\d+$/, "Must contain only numbers"),
  firstName: z.string().min(2, "First name must be at least 2 characters"),
  lastName: z.string().min(2, "Last name must be at least 2 characters"),
  email: z.string().email("Invalid email address"),
  phoneNumber: z
    .string()
    .length(10, "Phone number must be exactly 10 digits")
    .regex(/^\d+$/, "Must contain only numbers"),
  dateOfBirth: z.string().refine((value) => {
    const regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d$/;
    if (!regex.test(value)) return false;
    const [day, month, year] = value.split("/").map(Number);
    const date = new Date(year, month - 1, day);
    const age = new Date().getFullYear() - year;
    return (
      date.getDate() === day &&
      date.getMonth() === month - 1 &&
      date.getFullYear() === year &&
      age >= 0 &&
      age <= 120
    );
  }, "Invalid date of birth (DD/MM/YYYY)"),
  gender: z.enum(["male", "female", "other"], {
    required_error: "Please select a gender",
  }),
});

export default function PassengerForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      citizenId: "",
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      dateOfBirth: "",
      gender: undefined,
    },
  });

  function onSubmit(values: z.infer<typeof formSchema>) {
    const savedIsRoundTrip = sessionStorage.getItem("isRoundTrip");
    async function makePostRequestsDeparture() {
      try {
        const savedDepartureFlight = sessionStorage.getItem("departure_flight");
        if (!savedDepartureFlight) {
          return;
        }
        const [day, month, year] = values.dateOfBirth.split('/').map(str => parseInt(str, 10));;
        const isoDOB = new Date(year, month - 1, day).toISOString().replace(".000", "");
        const departureFlight: Flight = JSON.parse(savedDepartureFlight);
        const response1 = await fetch(
          "http://112.137.129.161:1803/api/v1/bookings",
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              booking_date: new Date().toISOString(),
              citizen_id: values.citizenId,
              dob: isoDOB,
              email: {
                string: values.email,
                valid: true,
              },
              first_name: values.firstName,
              flight_id: departureFlight.flight_id,
              last_name: values.lastName,
              phone_number: {
                string: values.phoneNumber,
                valid: true,
              },
              total_passengers: 1,
              total_price: departureFlight.price,
            }),
          },
        );

        if (!response1.ok) {
          throw new Error("First request failed");
        }

        const data1 = await response1.json(); 
        const booking_id = data1.booking_id; 
        const response2 = await fetch("http://112.137.129.161:1803/api/v1/passengers", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            "booking_id": booking_id,
            "citizen_id": {
              "string": values.citizenId,
              "valid": true
            },
            "dob": isoDOB,
            "email": {
              "string": values.citizenId,
              "valid": true
            },
            "first_name": values.firstName,
            "gender": values.gender,
            "last_name": values.lastName,
            "phone_number": {
              "string": values.phoneNumber,
              "valid": true
            },
            "seat_id": Math.floor(Math.random() * (280 - 1 + 1)) + 1,
          }),
        });

        if (!response2.ok) {
          throw new Error("Second request failed");
        }

        const data2 = await response2.json(); // Handle the second response
        console.log(data2);
        sessionStorage.setItem("booking", JSON.stringify(data1));
        sessionStorage.setItem("passenger", JSON.stringify(data2));
      } catch (error) {
        console.error("Error:", error);
      }
    }
    makePostRequestsDeparture();
  }


  return (
    <div className="relative flex min-h-screen items-center justify-center overflow-hidden bg-[#001830] p-4">
      {/* decorations*/}
      <div className="absolute inset-0 bg-gradient-to-br from-[#003876]/80 via-transparent to-transparent" />
      <div className="absolute bottom-0 left-0 h-96 w-96 -translate-x-1/2 translate-y-1/2 transform rounded-full bg-[#003876]/10 blur-3xl" />

      <Link href="/booking" className="absolute left-4 top-4">
        <Button
          variant="outline"
          className="border-[#C4B18D]/20 bg-white/10 text-[#C4B18D] hover:bg-white/20 hover:text-white"
        >
          Back to flights
        </Button>
      </Link>

      <div className="relative mx-auto w-full max-w-2xl">
        {/* Header Section */}
        <div className="mb-6 text-center">
          <div className="mb-4 inline-flex h-16 w-16 items-center justify-center rounded-full bg-gradient-to-br from-[#003876] to-[#002855]">
            <Plane className="h-8 w-8 text-[#C4B18D]" />
          </div>
          <h1 className="mb-2 text-3xl font-bold text-white">
            Passenger Information
          </h1>
          <p className="text-[#C4B18D]/80">Please fill in your details below</p>
        </div>

        {/* Main Form */}
        <div className="rounded-2xl border border-white/10 bg-white/10 shadow-2xl backdrop-blur-xl">
          <div className="p-8">
            <Form {...form}>
              <form
                onSubmit={form.handleSubmit(onSubmit)}
                className="space-y-8"
              >
                {/* Name Fields */}
                <div className="grid grid-cols-2 gap-6">
                  <FormField
                    control={form.control}
                    name="firstName"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-[#C4B18D]">
                          First Name
                        </FormLabel>
                        <FormControl>
                          <Input
                            placeholder="Hi"
                            {...field}
                            className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                        <FormLabel className="text-[#C4B18D]">
                          Last Name
                        </FormLabel>
                        <FormControl>
                          <Input
                            placeholder="Hello"
                            {...field}
                            className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                      <FormLabel className="text-[#C4B18D]">
                        Citizen ID
                      </FormLabel>
                      <FormControl>
                        <Input
                          placeholder="123456789012"
                          {...field}
                          className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                            className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                        <FormLabel className="text-[#C4B18D]">
                          Phone Number
                        </FormLabel>
                        <FormControl>
                          <Input
                            placeholder="1234567890"
                            {...field}
                            className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                        <FormLabel className="text-[#C4B18D]">
                          Date of Birth
                        </FormLabel>
                        <FormControl>
                          <Input
                            type="text"
                            placeholder="DD/MM/YYYY"
                            {...field}
                            className="border-[#C4B18D]/20 bg-white/5 text-white placeholder:text-white/50"
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
                        <Select
                          onValueChange={field.onChange}
                          value={field.value}
                        >
                          <FormControl>
                            <SelectTrigger className="border-[#C4B18D]/20 bg-white/5 text-white hover:bg-white/10 focus:bg-white/10">
                              <SelectValue placeholder="Select gender" />
                            </SelectTrigger>
                          </FormControl>
                          <SelectContent className="border-[#C4B18D]/20 bg-[#003876] text-white">
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
                  className="w-full bg-[#C4B18D] font-bold text-[#003876] hover:bg-[#A39066]"
                >
                  Confirm
                </Button>
              </form>
            </Form>
          </div>
        </div>
      </div>
    </div>
  );
}
