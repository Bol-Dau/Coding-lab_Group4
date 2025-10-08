#!/bin/bash
# Task 2:Intelligent Analysis Script
# This script analyzes selected log files and appends results to reports/analysis_report.txt 

# Defining the variables for the reports directory, analysis file, and the path for the log files to be analyzed. 
REPORT_DIR="hospital_data/reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"
LOG_DIR="hospital_data/active_logs"
CONTINUATION="y"

# Making sure that reports directory exisits.
mkdir -p "$REPORT_DIR"

# Creating a while loop for the user to analyze as many reports as they wish.
while [[ "$CONTINUATION" == "y" || "$CONTINUATION" == "Y" ]]; do       # This is to ensure that they input is case insensitive.
	# Interactive prompt
        echo "  "
        echo "Select log file to analyze:"
        echo "::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "1) Heart Rate (heart_rate_log.log)"
	echo "2) Temperature (temperature_log.log)"
	echo "3) Water Usage (water_usage_log.log)"
	echo "::::::::::::::::::::::::::::::::::::::::::::::::::"
	read -p "Enter choice (1-3): " choice
	echo "  "

	# Using case ... esac to solve the multiple choice answers, assigning each choice to a specific log file.
	case "$choice" in
		1) 
			LOG_FILE="$LOG_DIR/heart_rate_log.log" 
			;;
		2) 
			LOG_FILE="$LOG_DIR/temperature_log.log" 
			;;
		3) 
			LOG_FILE="$LOG_DIR/water_usage_log.log" 
			;;
		*) 
			echo "Invalid choice. Please run again with option 1, 2, or 3."     
			exit 1 ;;
		esac
		
		echo -ne "Analyzing"
                for i in {1..3};do
			echo -n "."
			sleep 1
		done
		sleep 0.1
		echo -ne "\r                                               \r"
		#Checking if the log file exists
		if [ ! -f "$LOG_FILE" ]; then
			echo "Error: Log file '$LOG_FILE' not found."
			echo -ne "Exiting"
			for i in {1..3};do
				echo -n "."
				sleep 1
			done
			sleep 0.1
			echo -ne "\r                                                   \r"
			exit 1
		fi


                # Analysis
                # Assumes log format: "timestamp device_name value"
                # Example: 2025-10-04T10:30:00 DeviceA 85
                # Counting the appearances of each device.
		DEVICE_COUNTS=$(awk '{print $3}' "$LOG_FILE" | sort | uniq -c | awk '{print $2": "$1}')

                # Collecting the first and last timestamps respectively.
		FIRST_TS=$(head -n 1 "$LOG_FILE" | awk '{print $2}')
		LAST_TS=$(tail -n 1 "$LOG_FILE" | awk '{print $2}')

                # Append the report to the report file.
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
		} | tee -a "$REPORT_FILE"   # (tee) helps to display the content on the terminal while (-a) appends it to the report file
	read -p "Do you want to analyze another file (y/n): " CONTINUATION
	done
	echo " Analysis complete. Results appended to $REPORT_FILE"
