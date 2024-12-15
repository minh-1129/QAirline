"use client";
import Link from "next/link";
import Image from "next/image";

export default function Header() {
  return (
    <header className="bg-white">
      <div className="container mx-auto px-6">
        {/* Top utility bar */}
        <div className="flex items-center justify-end space-x-2 py-1 text-xs">
          <Link href="#" className="text-gray-600 hover:text-blue-600">
            HELP
          </Link>
          <span className="text-gray-300">|</span>
          <Link href="#" className="text-gray-600 hover:text-blue-600">
            LOG-IN
          </Link>
          <span className="text-gray-300">|</span>
          <Link href="#" className="text-gray-600 hover:text-blue-700">
            SIGN UP
          </Link>
        </div>

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
              Plan Travel
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
              Member
            </Link>
          </nav>
        </div>
      </div>
    </header>
  );
}
