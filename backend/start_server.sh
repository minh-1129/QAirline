#!/usr/env/bin bash

# Define the log path
LOG_PATH="logs"

# Create the log directory if it doesn't exist
mkdir -p "$LOG_PATH"

# Clear the screen and run the application based on arguments
if [ "$1" == "swag" ]; then
    swag init --parseDependency  --parseInternal --parseDepth 1
fi

clear && echo "Logging logs to $LOG_PATH/logs.txt and errors to $LOG_PATH/errors.txt"
go run main.go 2> "$LOG_PATH/errors.txt" | tee "$LOG_PATH/logs.txt"