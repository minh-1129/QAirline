package database

import (
    "fmt"
    "log"
    "database/sql"
    _ "github.com/lib/pq"
)

// DropTable drops any table by its name if it exists
func DropTable(db *sql.DB, tableName string) error {
    query := fmt.Sprintf("DROP TABLE IF EXISTS %s;", tableName)
    _, err := db.Exec(query)
    if err != nil {
        log.Fatalf("Failed to drop table '%s': %v", tableName, err)
    }

    return nil
}

// ForceDropTable drops any table by its name
func ForceDropTable(db *sql.DB, tableName string) error {
    query := fmt.Sprintf("DROP TABLE IF EXISTS %s CASCADE;", tableName)
    _, err := db.Exec(query)
    if err != nil {
        log.Fatalf("Failed to drop table '%s': %v", tableName, err)
    }

    return nil
}

// TableExists checks if a table exists in the database
func TableExists(db *sql.DB, tableName string) (bool, error) {
    query := `
    SELECT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'  -- The schema where your table is located (usually 'public')
        AND table_name = $1
    )
    `

    var exists bool
    err := db.QueryRow(query, tableName).Scan(&exists)
    if err != nil {
        return false, fmt.Errorf("could not check if table exists: %v", err)
    }

    return exists, nil
}