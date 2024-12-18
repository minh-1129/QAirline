package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	// "sync"
	// "time"

	"webserver/api"
	"webserver/database"
	// "webserver/test"
)

// resetDatabase drops and recreates the database
func resetDatabase(db *sql.DB) error {
    // Drop all tables
    database.ForceDropTable(db, "aircrafts")
    database.ForceDropTable(db, "flights")
    database.ForceDropTable(db, "bookings")
    database.ForceDropTable(db, "passengers")
    database.ForceDropTable(db, "users")

    // Create all tables
    database.CreateAircraftsTable(db)
    database.CreateFlightsTable(db)
    database.CreateBookingsTable(db)
    database.CreatePassengersTable(db)
    database.CreateUsersTable(db)

    // // Create airports table
    database.ForceDropTable(db, "airports")
    database.CreateAirportsTable(db)
    database.BulkInsertAirports(db, "database/data/airports.csv")

    // Set up foreign key constraints
    database.SetFlightsForeignKeys(db)
    database.SetBookingsForeignKeys(db)
    database.SetPassengersForeignKeys(db)

    return nil
}

// initDatabase initializes the database
func initDatabase(useLocal bool, resetDB bool) (*sql.DB, error) {
    db, err := database.CreateConnection(useLocal)
    if err != nil {
        log.Printf("Error connecting to the database: %v\n", err)
        return nil, err
    }

    if resetDB {
        err = resetDatabase(db)
        if err != nil {
            log.Printf("Error resetting the database: %v\n", err)
            return nil, err
        }
        fmt.Println("Database reset successfully")
    }

    return db, nil
}

// StartServer starts the server in a goroutine
func startServer(runDetached bool, useLocal bool, resetDB bool) (*sql.DB, error) {
    db, err := initDatabase(useLocal, resetDB)
    if err != nil {
        log.Printf("Error initializing the database: %v\n", err)
        return nil, err
    }
    fmt.Println("Database initialized successfully")

    api.RegisterRoutes(db)

    // Run the server
    if runDetached {
        go func() {
            err := http.ListenAndServe(fmt.Sprintf("0.0.0.0:%d", api.API_PORT), nil)
            if err != nil {
                log.Printf("Error starting the server: %v\n", err)
                return
            }
        }()
    } else {
        err := http.ListenAndServe(fmt.Sprintf("0.0.0.0:%d", api.API_PORT), nil)
        if err != nil {
            log.Printf("Error starting the server: %v\n", err)
            return nil, err
        }
    }

    return db, nil
}

func main() {
    db, err := startServer(false, true, false)
    if err != nil {
        log.Printf("Error starting the server: %v\n", err)
        return
    }
    defer database.CloseConnection(db)
}