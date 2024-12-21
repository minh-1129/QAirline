package api_test

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	// "webserver/api"
)

type ResponseData struct {
    Status  string
    Body   []byte
}

func SendPostRequest(url string, body interface{}) (*ResponseData, error) {
    fmt.Println(url)

    jsonBody, err := json.Marshal(body)
    if err != nil {
        return nil, err
    }

    req, err := http.NewRequest(http.MethodPost, url, bytes.NewBuffer(jsonBody))
    if err != nil {
        return nil, err
    }

    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    bodyBytes, err := io.ReadAll(resp.Body)
    if err != nil {
        return nil, err
    }

    return &ResponseData{
        Status: resp.Status,
        Body: bodyBytes,
    }, nil
}