"use client";

import { useState } from "react";
import { Tabs, TabsList, TabsTrigger, TabsContent } from "@/components/ui/tabs";
import BookTripForm from "./Forms/BookTripForm" 
export default function SearchTabs() {
  const [activeTab, setActiveTab] = useState("book-trip");
  return (
    <div className="relative mx-auto rounded lg:px-40">
      <Tabs
        defaultValue="book-trip"
        value={activeTab}
        onValueChange={setActiveTab}
        className="w-full"
      >
        <TabsList className="grid w-full grid-cols-5 justify-center bg-[#0C5B6D] font-medium text-white">
          <TabsTrigger
            value="book-trip"
            className={`${
              activeTab === "book-trip"
                ? ""
                : ""
            }`}
          >
            BOOK TRIP
          </TabsTrigger>
          <TabsTrigger
            value="manage-booking"
            className={`${
              activeTab === "manage-booking"
                ? ""
                : ""
            }`}
          >
            MANAGE BOOKING
          </TabsTrigger>
          <TabsTrigger
            value="check-in"
            className={`${
              activeTab === "check-in"
                ? ""
                : ""
            }`}
          >
            CHECK IN
          </TabsTrigger>
          <TabsTrigger
            value="flight-status"
            className={`${
              activeTab === "flight-status"
                ? ""
                : ""
            }`}
          >
            FLIGHT STATUS
          </TabsTrigger>
          <TabsTrigger
            value="flight-schedule"
            className={`${
              activeTab === "flight-schedule"
                ? ""
                : ""
            }`}
          >
            FLIGHT SCHEDULE
          </TabsTrigger>
        </TabsList>

        <TabsContent value = "book-trip">
            <BookTripForm/>
        </TabsContent>

        
      </Tabs>
    </div>
  );
}
