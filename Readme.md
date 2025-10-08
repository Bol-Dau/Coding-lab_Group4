# Hospital Data Monitoring & Archival System Documentation

The Hospital Data Monitoring & Archival System is a utility designed to provide **robust data management** for patient health metric log files. The system performs two essential functions: **data archival** and **log analysis**.

***

## Key Features

### 1. Log File Archival

This function allows users to archive selected log files for **efficient storage** and **space management**.

* **Data Preservation:** Archiving files helps in **transferring data** easily and preserves the **original permissions** of the file, making restoration simple.
* **Continuous Cycle:** After a log file is archived (moved and compressed/packaged), the system automatically creates a **new, similar file**. This allows patient monitoring to continue uninterrupted, maintaining a **seamless data management cycle**.

### 2. Log Data Analysis

This feature provides **insightful data analysis** for monitoring patient health metrics.

* **Custom Selection:** You can choose which specific log file to analyze.
* **Detailed Reporting:** The system generates a report containing key metrics appended to a central report file. The analyzed data includes:
    * **Device Counts**: The total count of entries recorded by each individual device (e.g., Temp\_Recorder\_A).
    * **Timestamps**: The specific **time stamp for the first entry** and the **time stamp for the last entry** found in the log file.

***

## 🛠️ Setup and Prerequisites

To ensure the system runs correctly, the following directory structure must exist in your project root. The system uses the `mkdir -p` command to create the necessary directories if they are missing.

You bet\! Here's the complete `README.md` file, formatted neatly into a single block with important keywords **highlighted**, ready for you to copy and paste.

```markdown
# Hospital Data Monitoring & Archival System Documentation

The Hospital Data Monitoring & Archival System is a utility designed to provide **robust data management** for patient health metric log files. The system performs two essential functions: **data archival** and **log analysis**.

***

## Key Features

### 1. Log File Archival

This function allows users to archive selected log files for **efficient storage** and **space management**.

* **Data Preservation:** Archiving files helps in **transferring data** easily and preserves the **original permissions** of the file, making restoration simple.
* **Continuous Cycle:** After a log file is archived (moved and compressed/packaged), the system automatically creates a **new, similar file**. This allows patient monitoring to continue uninterrupted, maintaining a **seamless data management cycle**.

### 2. Log Data Analysis

This feature provides **insightful data analysis** for monitoring patient health metrics.

* **Custom Selection:** You can choose which specific log file to analyze.
* **Detailed Reporting:** The system generates a report containing key metrics appended to a central report file. The analyzed data includes:
    * **Device Counts**: The total count of entries recorded by each individual device (e.g., Temp\_Recorder\_A).
    * **Timestamps**: The specific **time stamp for the first entry** and the **time stamp for the last entry** found in the log file.

***

## 🛠️ Setup and Prerequisites

To ensure the system runs correctly, the following directory structure must exist in your project root. The system uses the `mkdir -p` command to create the necessary directories if they are missing.

```

.
└── hospital\_data/
├── active\_logs/    \# Location of the current log files
├── archived\_logs/  \# Destination for archived .tar files
└── reports/        \# Destination for the analysis\_report.txt

```

### Required Files

The shell scripts require the following log files to exist within the `hospital_data/active_logs/` directory for monitoring:

* `heart_rate_log.log`
* `temperature_log.log`
* `water_usage_log.log`

***

## 💻 Usage

The system is primarily operated using two interactive shell scripts:

### 1. Archiving Logs (`archive_logs.sh`)

This script handles the interactive archival process.

1.  Execute the script: `./archive_logs.sh`
2.  The script will prompt you to **select one of the three log files** for archiving.
3.  The file will be archived using the **uncompressed `tar` utility** and moved to the designated `archived_logs` folder. A new log file is then created to restart monitoring.

### 2. Analyzing Logs (`analyze_log.sh`)

This script handles the data analysis process.

1.  Execute the script: `./analyze_log.sh`
2.  The script will prompt you to **select a log file for analysis**.
3.  The analysis results will be displayed simultaneously on the terminal **and** permanently appended to the file: `hospital_data/reports/analysis_report.txt`.
```
