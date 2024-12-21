"use client";
import { usePathname } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import logo from "../images/runaway.jpg";

export default function Header() {
  const pathname = usePathname();

  return (
    <nav style={styles.navbar}>
      {/* Brand Logo */}
      <div style={styles.logoContainer}>
        <Image
          className="rounded-full"
          src={logo} // Replace with your logo's path
          alt="Brand Logo"
          width={40}
          height={40}
        />
        <span style={styles.brandName}>QAirline</span>
      </div>

      {/* Navigation Buttons */}
      <div style={styles.navLinks}>
        <Link
          href="/plane"
          style={
            pathname === "/plane"
              ? { ...styles.link, ...styles.activeLink }
              : styles.link
          }
        >
          Plane
        </Link>
        <Link
          href="/flight"
          style={
            pathname === "/flight"
              ? { ...styles.link, ...styles.activeLink }
              : styles.link
          }
        >
          Flight
        </Link>

        <Link
          href="/post"
          style={
            pathname === "/post"
              ? { ...styles.link, ...styles.activeLink }
              : styles.link
          }
        >
          Post
        </Link>
      </div>
      <button
        style={styles.logOutButton}
        className=" text-white bg-red-600 hover:bg-red-700 active:bg-red-800 font-medium rounded-lg text-sm px-3 py-2.5 me-2 mb-2"
        onClick={() => {
          window.location.href = "../";
        }}
      >
        Log out
      </button>
    </nav>
  );
}

const styles = {
  navbar: {
    display: "flex",
    justifyContent: "space-between",
    columnGap: "50px",
    alignItems: "center",
    padding: "10px 20px",
    backgroundColor: "#333",
    color: "#fff",
  },
  logoContainer: {
    display: "flex",
    alignItems: "center",
  },
  brandName: {
    marginLeft: "10px",
    fontSize: "1.5rem",
    fontWeight: "bold",
  },
  navLinks: {
    display: "flex",
    gap: "15px",
  },
  link: {
    textDecoration: "none",
    color: "#555",
    fontSize: "16px",
    padding: "5px 10px",
    borderRadius: "5px",
  },
  activeLink: {
    color: "#fff",
    backgroundColor: "#007bff", // Highlight color
    fontWeight: "bold",
  },
  logOutButton: {
    display: "inline",
    float: "right",
    fontWeight: "bold",
  },
};
