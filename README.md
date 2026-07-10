# 🚖 Milo Drive Data Analyst Assignment

## Overview

This repository contains my solution for the **Milo Drive Data Analyst Assignment**.

The project analyzes ride activity, payment transactions, and driver online time over a 7-day period to generate driver-level insights, identify operational anomalies, and visualize key performance metrics.

---

## Tech Stack

- **MySQL** – Database creation and data storage
- **Python**
- **Pandas** – Data cleaning and analysis
- **Matplotlib** – Data visualization
- **Jupyter Notebook** – Analysis workflow

---

## Repository Structure

```
MiloDrive-Data-Analyst-Assignment/
│
├── analysis.sql                # SQL script for database creation and basic analysis
├── analysis.ipynb              # Main Python analysis notebook
├── trip_activity.csv           # Ride activity dataset
├── payment_transactions.csv    # Payment transactions dataset
├── driver_activity.csv         # Driver online activity dataset
├── output/
│   ├── driver_total_earnings.png
│   ├── daily_earnings_trend.png
│   └── utilisation_vs_earnings.png
└── README.md
```

---

# Project Workflow

The project follows the following workflow:

1. Import the datasets into MySQL.
2. Create the required database and tables.
3. Clean and validate the imported data.
4. Connect MySQL with Python.
5. Perform exploratory data analysis using Pandas.
6. Merge the datasets.
7. Calculate driver-level KPIs.
8. Generate visualizations.
9. Summarize findings and recommendations.

---

# Key Performance Indicators (KPIs)

The following metrics were analyzed:

- Total Trips
- Total Earnings
- Average Trip Value
- Total Distance Travelled
- Driver Utilisation
- Daily Earnings Trend
- Driver Performance Comparison

---

# How to Run the Project

## Step 1: Install Required Libraries

```bash
pip install pandas
pip install matplotlib
pip install mysql-connector-python
```

---

## Step 2: Create the Database

Open **MySQL Workbench** and execute:

```
analysis.sql
```

This will:

- Create the database
- Create all required tables
- Prepare the database for analysis

---

## Step 3: Import CSV Files

Import the following files into their respective MySQL tables:

- trip_activity.csv
- payment_transactions.csv
- driver_activity.csv

---

## Step 4: Update Database Credentials

Open **analysis.ipynb** and update your MySQL connection details.

```python
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_PASSWORD",
    database="milodrive"
)
```

Replace `YOUR_PASSWORD` with your local MySQL password.

---

## Step 5: Run the Notebook

Execute all notebook cells sequentially.

The notebook will:

- Load data from MySQL
- Clean the data
- Calculate KPIs
- Generate charts
- Save the visualizations inside the `output` folder

---

# Output

The notebook generates the following visualizations:

- Driver-wise Total Earnings
- Daily Earnings Trend
- Driver Utilisation vs Earnings

All generated charts are automatically saved inside the **output/** directory.

---

# Key Findings

- Identified the highest-performing driver based on earnings and trip volume.
- Compared driver utilisation against total earnings.
- Investigated operational anomalies caused by low sample sizes.
- Generated recommendations for improving driver efficiency.

---

# Author

**Harsh Sindhal**

B.Tech Artificial Intelligence  
Chandigarh University

GitHub: https://github.com/YOUR_USERNAME
