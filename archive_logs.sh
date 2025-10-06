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

  
