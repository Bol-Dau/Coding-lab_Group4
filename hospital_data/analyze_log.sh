#!/usr/bin/env bash
# Task 2:Intelligent Analysis Script
# This script analyzes selected log files and appends results to reports/analysis_report.txt 

REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"
LOG_DIR="active_logs"

# Ensure reports directory exists
mkdir -p "$REPORT_DIR"

# Interactive prompt
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"
read -p "Enter choice (1-3): " choice

#validate choice and map to file
case "$choice" in
    1) LOG_FILE="$LOG_DIR/heart_rate_log.log" ;;
    2) LOG_FILE="$LOG_DIR/temperature_log.log" ;;
    3) LOG_FILE="$LOG_DIR/water_usage_log.log" ;;
    *) echo "Invalid choice. Please run again with option 1, 2, or 3."
       exit 1 ;;
esac

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

# Analysis
# Assumes log format: "timestamp device_name value"
# Example: 2025-10-04T10:30:00 DeviceA 85
DEVICE_COUNTS=$(awk '{print $3}' "$LOG_FILE" | sort | uniq -c | awk '{print $2": "$1}'
)

FIRST_TS=$(head -n 1 "$LOG_FILE" | awk '{print $2}')
LAST_TS=$(tail -n 1 "$LOG_FILE" | awk '{print $2}')

# Append to report
{
    echo "======================================"
    echo "Log Analysis Report"
    echo "Date: $(date)"
    echo "Analyzed File: $LOG_FILE"
    echo
    echo "Device Counts:"
    echo "$DEVICE_COUNTS"
    echo
    echo "First Entry Timestamp: $FIRST_TS"
    echo "Last Entry Timestamp : $LAST_TS"
    echo "======================================"
    echo
} >> "$REPORT_FILE"

echo " Analysis complete. Results appended to $REPORT_FILE"
