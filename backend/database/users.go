package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
)

// User struct for users table
type User struct {
    UserID         int `json:"user_id"`
    CitizenID      string `json:"citizen_id"`
    Username       string `json:"username"`
    HashedPassword string `json:"hashed_password"`
    FirstName      string `json:"first_name"`
    LastName       string `json:"last_name"`
    Email          sql.NullString `json:"email"`
    PhoneNumber    sql.NullString `json:"phone_number"`
    Dob            time.Time `json:"dob"`
    Gender         string `json:"gender"`
}

const DOB_LAYOUT = "2006-01-02"

// CreateUsersTable creates the 'users' table
func CreateUsersTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS users (
        user_id SERIAL PRIMARY KEY,                -- Unique identifier for the user
        citizen_id VARCHAR(100) UNIQUE NOT NULL,   -- Unique identifier for the user
        username VARCHAR(100) UNIQUE NOT NULL,            -- Username of the user
        hashed_password VARCHAR(100) NOT NULL,     -- Hashed password of the user
        first_name VARCHAR(100) NOT NULL,          -- First name of the user
        last_name VARCHAR(100) NOT NULL,           -- Last name of the user
        email VARCHAR(100),               -- Email address of the user
        phone_number VARCHAR(20),                -- PhoneNumber number of the user
        dob DATE NOT NULL,                  -- Date of birth of the user
        gender VARCHAR(10) NOT NULL         --
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'users' table: %v", err)
        return err
    }

    return nil
}

// GetUserByID retrieves a user by their ID
func GetUserByID(db *sql.DB, userID int) (*User, error) {
    query := `SELECT user_id, citizen_id, username, hashed_password, first_name, last_name, email, phone_number, dob, gender
                FROM users WHERE user_id = $1`

    user := User{}
    err := db.QueryRow(query, userID).Scan(
        &user.UserID,
        &user.CitizenID,
        &user.Username,
        &user.HashedPassword,
        &user.FirstName,
        &user.LastName,
        &user.Email,
        &user.PhoneNumber,
        &user.Dob,
        &user.Gender,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get user: %v", err)
    }

    return &user, nil
}

// InsertUser inserts a new user into the users table
func InsertUser(db *sql.DB, user *User) (int, error) {
    query := `
    INSERT INTO users (citizen_id, username, hashed_password, first_name, last_name, email, phone_number, dob, gender)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING user_id
    `

    dob := user.Dob.Format(DOB_LAYOUT)

    var userID int
    err := db.QueryRow(
        query,
        user.CitizenID,
        user.Username,
        user.HashedPassword,
        user.FirstName,
        user.LastName,
        user.Email,
        user.PhoneNumber,
        dob,
        user.Gender,
    ).Scan(&userID)
    if err != nil {
        return 0, fmt.Errorf("could not insert user: %v", err)
    }

    return userID, nil
}

// UpdateUser updates a user's details
func UpdateUser(db *sql.DB, user *User) error {
    query := `
    UPDATE users
    SET citizen_id = $1, username = $2, hashed_password = $3, first_name = $4, last_name = $5, email = $6, phone_number = $7, dob = $8, gender = $9
    WHERE user_id = $10
    `

    dob := user.Dob.Format(DOB_LAYOUT)

    _, err := db.Exec(
        query,
        user.CitizenID,
        user.Username,
        user.HashedPassword,
        user.FirstName,
        user.LastName,
        user.Email,
        user.PhoneNumber,
        dob,
        user.Gender,
        user.UserID,
    )
    if err != nil {
        log.Printf("could not update user: %v", err)
        return err
    }

    return nil
}

// RemoveUser removes a user by their ID
func RemoveUser(db *sql.DB, userID int) error {
    query := `DELETE FROM users WHERE user_id = $1`

    _, err := db.Exec(query, userID)
    if err != nil {
        log.Printf("could not remove user: %v", err)
        return err
    }

    return nil
}

// GetAllUsers retrieves all users from the 'users' table
func GetAllUsers(db *sql.DB) ([]User, error) {
    query := `SELECT user_id, citizen_id, username, hashed_password, first_name, last_name, email, phone_number, dob, gender
                FROM users`

    rows, err := db.Query(query)
    if err != nil {
        return nil, fmt.Errorf("error fetching users: %v", err)
    }
    defer rows.Close()

    users := []User{}
    for rows.Next() {
        var user User
        if err := rows.Scan(
            &user.UserID,
            &user.CitizenID,
            &user.Username,
            &user.HashedPassword,
            &user.FirstName,
            &user.LastName,
            &user.Email,
            &user.PhoneNumber,
            &user.Dob,
            &user.Gender,
        ); err != nil {
            return nil, fmt.Errorf("error scanning row: %v", err)
        }
        users = append(users, user)
    }
    if err := rows.Err(); err != nil {
        return nil, fmt.Errorf("error iterating rows: %v", err)
    }

    return users, nil
}

// GetUserByCitizenID retrieves a user by their citizen ID
func GetUserByCitizenID(db *sql.DB, citizenID string) (*User, error) {
    query := `SELECT user_id, citizen_id, username, hashed_password, first_name, last_name, email, phone_number, dob, gender
                FROM users WHERE citizen_id = $1`

    user := User{}
    err := db.QueryRow(query, citizenID).Scan(
        &user.UserID,
        &user.CitizenID,
        &user.Username,
        &user.HashedPassword,
        &user.FirstName,
        &user.LastName,
        &user.Email,
        &user.PhoneNumber,
        &user.Dob,
        &user.Gender,
    )
    if err != nil {
        return nil, fmt.Errorf("could not get user by citizen ID: %v", err)
    }

    return &user, nil
}