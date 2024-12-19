"use client";
import Link from "next/link";
import Image from "next/image";

export default function Header() {
  return (
    <header className="bg-white">
      <div className="container mx-auto px-6">

        {/* Main header */}
        <div className="flex items-center justify-center">
          {/* Logo */}
          <Link href="/" className="flex items-center">
            <Image
              src=""
              alt="QAirline"
              width={180}
              height={40}
              className="h-12 w-auto"
            />
          </Link>

          {/* Main navigation */}
          <nav className="flex items-center space-x-8">
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Book Flights
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Your Flights
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Travel Info
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Login
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Signup
            </Link>
          </nav>
        </div>
      </div>
    </header>
  );
}
