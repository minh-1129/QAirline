package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"

	// "fmt"
	"net/http"
	"strconv"

	// "time"
	"webserver/database"
)

// @Summary Create a user
// @Description Create a user
// @Tags users
// @Accept json
// @Produce json
// @Param user body database.User true "User object"
// @Success 200 {object} database.User
// @Router /api/v1/users [post]
// CreateUser creates a new user
func CreateUser(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var user database.User
        err := json.NewDecoder(r.Body).Decode(&user)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to create user: %v\n", err)
            return
        }

        userID, err := database.InsertUser(db, &user)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to create user: %v\n", err)
            return
        }

        user.UserID = userID
        respondWithJSON(r, w, http.StatusCreated, user)
    }
}

// @Summary Get user by ID
// @Description Get user by ID
// @Tags users
// @Accept json
// @Produce json
// @Param user_id path int true "User ID"
// @Success 200 {object} database.User
// @Router /api/v1/users/user/{user_id} [get]
// GetUserByID retrieves a user by their ID
func GetUserByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        userIDStr := GetLastPath(r)
        userID, err := strconv.Atoi(userIDStr)

        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to get user: %v\n", err)
            return
        }

        user, err := database.GetUserByID(db, userID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get user: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, user)
    }
}

// @Summary Get user by citizen ID
// @Description Get user by citizen ID
// @Tags users
// @Accept json
// @Produce json
// @Param citizen_id path string true "Citizen ID"
// @Success 200 {object} database.User
// @Router /api/v1/users/search/citizen_id/{citizen_id} [get]
// GetUserByCitizenID retrieves a user by their citizen ID
func GetUserByCitizenID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        citizenID := GetLastPath(r)

        user, err := database.GetUserByCitizenID(db, citizenID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get user: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, user)
    }
}

// @Summary Update user by ID
// @Description Update user by ID
// @Tags users
// @Accept json
// @Produce json
// @Param user_id path int true "User ID"
// @Param user body database.User true "User object"
// @Success 200 {object} database.User
// @Router /api/v1/users/user/{user_id} [put]
// UpdateUserByID updates a user by their ID
func UpdateUserByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        userIDStr := GetLastPath(r)
        userID, err := strconv.Atoi(userIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update user: %v\n", err)
            return
        }

        var user database.User
        err = json.NewDecoder(r.Body).Decode(&user)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to update user: %v\n", err)
            return
        }

        user.UserID = userID
        err = database.UpdateUser(db, &user)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update user: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, user)
    }
}

// @Summary Remove user by ID
// @Description Remove user by ID
// @Tags users
// @Accept json
// @Produce json
// @Param user_id path int true "User ID"
// @Success 200 {object} database.User
// @Router /api/v1/users/user/{user_id} [delete]
// DeleteUserByID deletes a user by their ID
func RemoveUserByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        userIDStr := GetLastPath(r)
        userID, err := strconv.Atoi(userIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete user: %v\n", err)
            return
        }

        err = database.RemoveUser(db, userID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to delete user: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "user deleted"})
    }
}

// @Summary Get all users
// @Description Get all users
// @Tags users
// @Accept json
// @Produce json
// @Success 200 {object} []database.User
// @Router /api/v1/users [get]
// GetAllUsers retrieves all users
func GetAllUsers(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        users, err := database.GetAllUsers(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get users: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, users)
    }
}

// RegisterUsersRoutes initializes all user routes
func RegisterUsersRoutes(db *sql.DB) {
    // Register the API routes
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, UserRoute)),
        GetAllUsers(db),
    )
    http.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, UserRoute)),
        CreateUser(db),
    )
    http.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, UserRoute, "user", "{user_id}")),
        UpdateUserByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, UserRoute, "user", "{user_id}")),
        RemoveUserByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, UserRoute, "user", "{user_id}")),
        GetUserByID(db),
    )
    http.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, UserRoute, "search", "citizen_id", "{citizen_id}")),
        GetUserByCitizenID(db),
    )
}