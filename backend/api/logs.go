package api

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"
)

const LogsPath = "./logs"

// Read logs.txt from the logs directory and display the contents on html
func GetLogs(w http.ResponseWriter, r *http.Request) {
    // Get the current working directory
    dir, err := os.Getwd()
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    // Get the full path to the logs directory
    logsDir := filepath.Join(dir, LogsPath)

    // Get the full path to the logs file
    logsFile := filepath.Join(logsDir, "logs.txt")

    // Read the contents of the logs file
    content, err := os.ReadFile(logsFile)
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    // Display the content of the logs file
    w.Header().Set("Content-Type", "text/plain")
    w.Header().Add("Access-Control-Allow-Origin", "*")
    w.WriteHeader(http.StatusOK)
    w.Write(content)
}

// Read errors.txt from the logs directory and display the contents on html
func GetErrors(w http.ResponseWriter, r *http.Request) {
    // Get the current working directory
    dir, err := os.Getwd()
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    // Get the full path to the logs directory
    logsDir := filepath.Join(dir, LogsPath)

    // Get the full path to the errors file
    errorsFile := filepath.Join(logsDir, "errors.txt")

    // Read the contents of the errors file
    content, err := os.ReadFile(errorsFile)
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    // Display the content of the errors file
    w.Header().Set("Content-Type", "text/plain")
    w.Header().Add("Access-Control-Allow-Origin", "*")
    w.WriteHeader(http.StatusOK)
    w.Write(content)
}

// Display both files on the html and auto refresh every 5 seconds
func GetLogsAndErrors(w http.ResponseWriter, r *http.Request) {
    // Display the content of the logs file in 2 scrollable columns
    w.Header().Set("Content-Type", "text/html")
    w.Header().Add("Access-Control-Allow-Origin", "*")
    w.WriteHeader(http.StatusOK)

    // read html from logs.html file
    dir, err := os.Getwd()
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    // Get the full path to the logs directory
    logsDir := filepath.Join(dir, LogsPath)

    // Get the full path to the html file
    htmlFile := filepath.Join(logsDir, "logs.html")
    content, err := os.ReadFile(htmlFile)
    if err != nil {
        respondWithJSON(r, w, http.StatusInternalServerError, map[string]string{"error": err.Error()})
        return
    }

    w.Write(content)
}

// RegisterLogsRoutes initializes all routes for logs
func RegisterLogsRoutes(handleAuth func(http.HandlerFunc) http.HandlerFunc, mux *http.ServeMux) {
    // Register the logs routes
    mux.HandleFunc(
        fmt.Sprintf("/%s", GetJoinedPath(API_BASE_URL, LogsRoute)),
        handleAuth(GetLogsAndErrors),
    )
    mux.HandleFunc(
        fmt.Sprintf("/%s", GetJoinedPath(API_BASE_URL, LogsRoute, "errors")),
        handleAuth(GetErrors),
    )
    mux.HandleFunc(
        fmt.Sprintf("/%s", GetJoinedPath(API_BASE_URL, LogsRoute, "logs")),
        handleAuth(GetLogs),
    )
}