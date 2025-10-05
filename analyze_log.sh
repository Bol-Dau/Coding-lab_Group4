#!/usr/bin/env bash
# Task 2:Intelligent Analysis Script
# This script analyzes selected log files and appends results to reports/analysis_report.txt 

REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"
LOG_DIR="hospital_data/active_logs"

# Ensure reports directory exists
mkdir -p "$REPORT_DIR"

# Interactive prompt
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

#validate choice and map to file
case "$choice" in
    1) LOG_FILE="$LOG_DIR/heart_rate.log" ;;
    2) LOG_FILE="$LOG_DIR/temperature.log" ;;
    3) LOG_FILE="$LOG_DIR/water_usage.log" ;;
    *) echo "Invalid choice. Please run again with option 1, 2, or 3."
       exit 1 ;;
esac

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi
