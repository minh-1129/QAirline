package database

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

const (
    HOST     = "localhost"
    PORT     = 1802
    USER     = "postgres"
    PASSWORD = "secret"
    DBNAME   = "qairline"
)

// CreateConnection opens a connection to the PostgreSQL database using constants
func CreateConnection(useLocal bool) (*sql.DB, error) {
    // // Build the connection string using the constants
    connStr := fmt.Sprintf("user=%s password=%s dbname=%s host=%s port=%d sslmode=disable",
                           USER, PASSWORD, DBNAME, HOST, PORT)

    if !useLocal {
        // Load the .env file
        if err := godotenv.Load(); err != nil {
            return nil, fmt.Errorf("could not load .env file: %v", err)
        }

        // Update the connection string using the environment variables
        connStr = os.Getenv("DATABASE_URL")
    }

    // Open the connection
    db, err := sql.Open("postgres", connStr)
    if err != nil {
        return nil, fmt.Errorf("could not open database connection: %v", err)
    }

    // Ping the database to make sure the connection is valid
    if err := db.Ping(); err != nil {
        return nil, fmt.Errorf("could not connect to database: %v", err)
    }

    return db, nil
}

// CloseConnection closes the database connection
func CloseConnection(db *sql.DB) error {
    if err := db.Close(); err != nil {
        log.Printf("Error closing database connection: %v", err)
        return err
    } else {
        fmt.Println("Database connection closed")
    }

    return nil
}