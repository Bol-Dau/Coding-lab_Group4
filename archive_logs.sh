#!/bin/bash

CONTINUATION="y"

# Defining a function that will handle the archiving of the files 
ARCHIVE_FUN() {

	# Setting the paremeters for the log files and their desiginated destination.
	LOG_FILE=$1
        ARCHIVE_DESTINATION=$2

	# Defining variables for the timestamp, log file and archive destiantion.
	TIME_STAMP=$(date +"%Y-%m-%d_%H:%M:%S")
	FILE_NAME="hospital_data/active_logs/$LOG_FILE"
	ARCHIVED_FILE="hospital_data/archived_logs/$ARCHIVE_DESTINATION/${LOG_FILE}_$TIME_STAMP.log"

        # Checking first if the file exists or not.
	if [ -f "$FILE_NAME" ]; then
		echo "Archiving process initiated"
                echo "Archiving $FILE_NAME"
                tar -cvf "$ARCHIVED_FILE" "$FILE_NAME"
                #Creating a new similar file for continued monitoring
                touch "$FILE_NAME"
                echo -e "You have successfully archived your file\n"
	else
		echo "File not found"
		echo -ne "Exiting"
		for i in {1..3};do
			echo -n "."
                        sleep 1
		done
                sleep 0.1
                echo -ne "\r                                                \r"
		exit 1
	        fi
}

# Creating a loop where the user can archive as many files as they want.
while [[ "$CONTINUATION" == "y" || "$CONTINUATION" == "Y" ]]; do # These two arguments are to make the response case insensitive
	echo "  "
	echo ":::::::::::::::::::::::::::::::::::::::::::::::"
	echo "Choose the log file to archive: "
	echo "1) Heart Rate"
	echo "2) Temperature"
	echo "3) Water Usage"  
	read -p "Enter choice (1-3): " choice
	echo "":::::::::::::::::::::::::::::::::::::::::::::::""
	echo "   "
	echo -ne "Processing your file"
	for i in {1..3};do
           echo -n "."
           sleep 1
        done
	sleep 0.1
        echo -ne "\r                                               \r"

	case $choice in
		1)
			ARCHIVE_FUN "heart_rate_log.log" "heart_data_archive"
			;;
		2)
			ARCHIVE_FUN "temperature_log.log" "temperature_data_archive"
			;;    
		3)
			ARCHIVE_FUN "water_usage_log.log" "water_usage_data_archive"
			;;
		*)
			echo "Invalid choice! Please enter 1, 2, or 3."
			exit 1
			;;
		esac
		read -p "Do you want to archive another log file? (y/n): " CONTINUATION
	done

	echo -e "Congratulations!!!\nThe archiving process has successfully been completed.\n"
