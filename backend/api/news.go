package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"webserver/database"
)

// @Summary Get news by ID
// @Description Get a news article by its ID
// @Tags news
// @Accept json
// @Produce json
// @Param news_id path int true "News ID"
// @Success 200 {object} database.News
// @Router /api/v1/news/{news_id} [get]
// GetNewsByID retrieves a news article by its ID
func GetNewsByID(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        newsIDStr := GetLastPath(r)
        newsID, err := strconv.Atoi(newsIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Invalid news ID: %v\n", err)
            return
        }

        news, err := database.GetNewsByID(db, newsID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get news article: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, news)
    }
}

// @Summary Create news
// @Description Create a new news article
// @Tags news
// @Accept json
// @Produce json
// @Param news body database.News true "News object"
// @Success 200 {object} database.News
// @Router /api/v1/news [post]
// InsertNews inserts a new news article into the news table
func InsertNews(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        news := database.News{}
        err := json.NewDecoder(r.Body).Decode(&news)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Invalid request payload: %v\n", err)
            return
        }

        newsID, err := database.InsertNews(db, news)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to insert news article: %v\n", err)
            return
        }
        news.NewsID = newsID

        respondWithJSON(r, w, http.StatusOK, news)
    }
}

// @Summary Update news
// @Description Update a news article
// @Tags news
// @Accept json
// @Produce json
// @Param news_id path int true "News ID"
// @Param news body database.News true "News object"
// @Success 200
// @Router /api/v1/news/{news_id} [put]
// UpdateNews updates a news article in the news table
func UpdateNews(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        newsIDStr := GetLastPath(r)
        newsID, err := strconv.Atoi(newsIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Invalid news ID: %v\n", err)
            return
        }

        news := database.News{}
        err = json.NewDecoder(r.Body).Decode(&news)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Invalid request payload: %v\n", err)
            return
        }

        news.NewsID = newsID
        err = database.UpdateNews(db, news)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to update news article: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, news)
    }
}

// @Summary Delete news
// @Description Delete a news article
// @Tags news
// @Accept json
// @Produce json
// @Param news_id path int true "News ID"
// @Success 200
// @Router /api/v1/news/{news_id} [delete]
// RemoveNews removes a news article by its ID
func RemoveNews(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        newsIDStr := GetLastPath(r)
        newsID, err := strconv.Atoi(newsIDStr)
        if err != nil {
            respondWithJSON(r, w, http.StatusBadRequest, map[string]string{"error": err.Error()})
            log.Printf("Invalid news ID: %v\n", err)
            return
        }

        err = database.RemoveNews(db, newsID)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to remove news article: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, map[string]string{"message": "delete successful"})
    }
}

// @Summary Get all news
// @Description Get all news articles
// @Tags news
// @Accept json
// @Produce json
// @Success 200 {array} database.News
// @Router /api/v1/news [get]
// GetAllNews retrieves all news articles
func GetAllNews(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        news, err := database.GetAllNews(db)
        if err != nil {
            respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
            log.Printf("Failed to get news articles: %v\n", err)
            return
        }

        respondWithJSON(r, w, http.StatusOK, news)
    }
}

// RegisterNewsRoutes registers news routes
func RegisterNewsRoutes(db *sql.DB, mux *http.ServeMux) {
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, NewsRoute)),
        GetAllNews(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("GET /%s", GetJoinedPath(API_BASE_URL, NewsRoute, "{news_id}")),
        GetNewsByID(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("POST /%s", GetJoinedPath(API_BASE_URL, NewsRoute)),
        InsertNews(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("PUT /%s", GetJoinedPath(API_BASE_URL, NewsRoute, "{news_id}")),
        UpdateNews(db),
    )
    mux.HandleFunc(
        fmt.Sprintf("DELETE /%s", GetJoinedPath(API_BASE_URL, NewsRoute, "{news_id}")),
        RemoveNews(db),
    )
}
