package database

import (
    "database/sql"
    "fmt"
    "log"

    _ "github.com/lib/pq"
)

type News struct {
    NewsID   int    `json:"news_id"`
    Title    string `json:"title"`
    Content  string `json:"content"`
    Category string `json:"category"`
}

// CreateNewsTable creates the 'news' table
func CreateNewsTable(db *sql.DB) error {
    createTableQuery := `
    CREATE TABLE IF NOT EXISTS news (
        news_id SERIAL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        category VARCHAR(255) NOT NULL
    )
    `
    _, err := db.Exec(createTableQuery)
    if err != nil {
        log.Printf("Failed to create 'news' table: %v\n", err)
        return err
    }

    return nil
}

// GetNewsByID retrieves a news article by its ID
func GetNewsByID(db *sql.DB, newsID int) (*News, error) {
    query := `SELECT news_id, title, content, category
              FROM news WHERE news_id = $1`

    news := News{}
    err := db.QueryRow(query, newsID).Scan(&news.NewsID, &news.Title, &news.Content, &news.Category)
    if err != nil {
        return nil, fmt.Errorf("could not get news article: %v", err)
    }

    return &news, nil
}

// InsertNews inserts a new news article into the news table
func InsertNews(db *sql.DB, news News) (int, error) {
    query := `
    INSERT INTO news (title, content, category)
    VALUES ($1, $2, $3)
    RETURNING news_id
    `
    var newsID int
    err := db.QueryRow(query, news.Title, news.Content, news.Category).Scan(&newsID)
    if err != nil {
        return 0, fmt.Errorf("could not insert news article: %v", err)
    }

    return newsID, nil
}

// UpdateNews updates a news article in the news table
func UpdateNews(db *sql.DB, news News) error {
    query := `
    UPDATE news
    SET title = $1, content = $2, category = $3
    WHERE news_id = $4
    `
    _, err := db.Exec(query, news.Title, news.Content, news.Category, news.NewsID)
    if err != nil {
        return fmt.Errorf("could not update news article: %v", err)
    }

    return nil
}

// RemoveNews removes a news article by its ID
func RemoveNews(db *sql.DB, newsID int) error {
    query := `DELETE FROM news WHERE news_id = $1`
    _, err := db.Exec(query, newsID)
    if err != nil {
        return fmt.Errorf("could not remove news article: %v", err)
    }

    return nil
}

// GetAllNews retrieves all news articles from the news table
func GetAllNews(db *sql.DB) ([]News, error) {
    query := `SELECT news_id, title, content, category FROM news`
    rows, err := db.Query(query)
    if err != nil {
        return nil, fmt.Errorf("could not get news articles: %v", err)
    }
    defer rows.Close()

    newsList := []News{}
    for rows.Next() {
        news := News{}
        err := rows.Scan(&news.NewsID, &news.Title, &news.Content, &news.Category)
        if err != nil {
            return nil, fmt.Errorf("could not get news articles: %v", err)
        }
        newsList = append(newsList, news)
    }

    return newsList, nil
}