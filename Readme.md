# Hospital Data Monitoring & Archival System

## Overview
The **Hospital Data Monitoring & Archival System** is a Linux-based automation solution designed to assist hospitals in managing and analyzing patient health log files. It performs two primary functions:

1. **Archiving Log Files**
2. **Analyzing Patient Data**

This system streamlines data management by automating the archiving and analysis of health metrics such as heart rate, temperature, and water usage.

---

## 1. Archiving Log Files

Archiving files helps in:
- **Storing data efficiently**
- **Saving and managing disk space**
- **Simplifying data transfer**
- **Preserving original file permissions**

The Hospital Monitoring & Archival System allows you to **archive any hospital log file of your choice**. Once a file is archived, a new log file with the same name is automatically created so that monitoring of patients’ health metrics continues seamlessly.

This cyclical archiving process ensures that:
- No patient data is lost.
- Old data remains safely stored.
- New data collection continues uninterrupted.

This is the **first core function** and beauty of our system.

---

## 2. Data Analysis

Beyond archiving, the Hospital Monitoring & Archival System offers intelligent **data analysis capabilities**.

The system enables you to:
- Select a specific log file to analyze.
- View **device usage counts** (e.g., how many times each device appears in the log).
- Identify **timestamps for the first and last recorded entries** for each device.

This provides valuable insights into:
- Device activity trends.
- Patient monitoring frequency.
- Operational patterns across different devices.

This is the **second core function** and another key strength of our system.

---

## Features
- Interactive user interface via terminal menu.
- Log file selection and validation.
- Automated data summarization and reporting.
- Report generation saved to `reports/analysis_report.txt`.
- Timestamp tracking for data monitoring.

---

## Technologies Used
- **Shell Scripting (Bash)**
- **AWK**, **GREP**, **SORT**, **UNIQ**, **HEAD**, **TAIL**
- **DATE**, **MV**, **TOUCH**
- **Linux File Management and Archival Utilities**

---

## Directory Structure


