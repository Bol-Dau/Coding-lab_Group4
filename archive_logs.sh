#!/bin/bash

ACTIVE_DIR="active_logs"

HEART_LOG="${ACTIVE_DIR}/heart_rate_log.log"
TEMP_LOG="${ACTIVE_DIR}/temperature_log.log"
WATER_LOG="${ACTIVE_DIR}/water_usage_log.log"

HEART_ARCHIVE="heart_data_archive"
TEMP_ARCHIVE="temperature_data_archive"
WATER_ARCHIVE="water_data_archive"

# --- Ensure archive directories exist ---
mkdir -p "$HEART_ARCHIVE" "$TEMP_ARCHIVE" "$WATER_ARCHIVE"

# --- Display menu ---
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# --- Function to perform the archiving ---
archive_log() {
    local log_file=$1
    local archive_dir=$2
    local log_type=$3

    # Check if log file exists
    if [ ! -f "$log_file" ]; then
        echo " Error: Log file '$log_file' not found!"
        exit 1
    fi

# Create timestamp for renaming

local timestamp
timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
local archive_file="${archive_dir}/${log_type}_${timestamp}.log"

echo "Archiving ${log_type} log..."

# Move and rename the file

mv "$log_file" "$archive_file" 2>/dev/null

if [ $? -ne 0 ]; then
    echo " Error: Could not move log to archive directory!"
    exit 1
fi

# Create a new empty log for continued monitoring
touch "$log_file"

echo " Successfully archived to: $archive_file"
}

# --- Handle user choice ---
case $choice in
    1)
        archive_log "$HEART_LOG" "$HEART_ARCHIVE" "heart_rate"
        ;;
    2) archive_log "$TEMP_LOG" "$TEMP_ARCHIVE" "temperature"
        ;;
    3)
        archive_log "$WATER_LOG" "$WATER_ARCHIVE" "water_usage"
        ;;
    *)
        echo " Invalid choice. Please run the script again and choose 1–3."
        exit 1
        ;;
esac







 
