#!/bin/bash
# Script Name: archive_logs.sh
# Description : Archives selected hospital log file interactively

# Base directories
BASE_DIR="hospital_data"
ACTIVE_DIR="$BASE_DIR/active_logs"
HEART_ARCHIVE="$BASE_DIR/heart_data_archive"
TEMP_ARCHIVE="$BASE_DIR/temp_data_archive"
WATER_ARCHIVE="$BASE_DIR/water_data_archive"

# Log files
HEART_LOG="$ACTIVE_DIR/heart_rate.log"
TEMP_LOG="$ACTIVE_DIR/temperature.log"
WATER_LOG="$ACTIVE_DIR/water_usage.log"

# Make sure archive directories exist
mkdir -p "$HEART_ARCHIVE" "$TEMP_ARCHIVE" "$WATER_ARCHIVE"

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Timestamp format
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
