import Link from "next/link";
import Image from "next/image";

export default function Header() {
  return (
    <header className="relative bg-white">
      {/* Utility bar */}
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-end space-x-2 py-1.5 text-[0.5rem]">
          <Link href="#" className="text-gray-600 hover:text-blue-600">
            LOG-IN
          </Link>
          <span className="text-gray-300">|</span>
          <Link href="#" className="text-gray-600 hover:text-blue-600">
            SIGN UP
          </Link>
          <span className="text-gray-300">|</span>
          <Link href="#" className="text-gray-600 hover:text-blue-700">
            HELP
          </Link>
        </div>
      </div>

      {/* Main navigation */}
      <div className="">
        <div className="container relative mx-auto px-4">
          {/* Logo*/}
          <Link
            href="/"
            className="absolute left-4 top-1/2 flex -translate-y-1/2 items-center"
            style={{ transform: "translateY(-50%)" }}
          >
            <Image
              src=""
              alt="QAirline"
              width={180}
              height={40}
              className="h-16 w-auto"
            />
          </Link>

          {/* Navigation links */}
          <nav className="flex justify-end space-x-8 py-1.5">
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Plan your trip
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Your flights
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              Travel information
            </Link>
            <Link
              href="#"
              className="border-b-2 border-transparent pb-1 text-xs text-gray-700 hover:border-blue-600 hover:text-blue-600"
            >
              News
            </Link>
          </nav>
        </div>
      </div>
    </header>
  );
}
