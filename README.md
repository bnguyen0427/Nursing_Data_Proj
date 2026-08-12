# US Nursing Homes Investment Project (2015–2021)

---
## Overview
An end-to-end data project analyzing 14,900+ nursing homes across the United States to identify investment opportunities in the skilled nursing facility (SNF) industry — a sector positioned for growth as America's population ages.

The project combines a Python/pandas ETL pipeline with an interactive Tableau dashboard, turning raw CMS provider, cost report, quality, and penalty data into decision-ready insights for investors.

---

## Project Objectives

1. Analyzes nursing home data from 2015–2021 to find **investment opportunities**.
2. Provides an **interactive dashboard** so investors can explore the data on their own.
3. Highlights which facilities/regions look **financially strong vs. risky**.

## Business Contexts

The US population is aging fast, which means more people will need nursing home care in the coming years. But nursing homes are expensive to run and often operate on thin profit margins. This project helps investors answer:

- Which states have the healthiest nursing home finances?
- Where is the aging population growing but investment hasn't caught up yet?
- Does ownership type (for-profit, non-profit, government) or location (rural vs. urban) affect performance?
- What red flags (low ratings, fines, poor margins) should investors watch for?

---

## Datasets

All data comes from **CMS (Centers for Medicare & Medicaid Services)**, a public US government source. I used 5 different datasets, each covering 2015–2021:

- **Provider Info** – basic facility details (name, location, ownership, ratings)
- **Cost Reports** – yearly financials (revenue, income, expenses, assets)
- **Health Deficiencies** – inspection/violation records
- **Quality Measures** – care quality scores
- **Penalties** – fines and payment denials

## Data Cleaning Process

Government data is messy, so I built a Python pipeline (`Data_Cleaning.ipynb`) to fix that. In plain terms, here's what it does:

1. **Loaded 7 years of files for 5 different datasets** and made column names consistent (CMS changed their naming format in 2020, so I had to map old names to new ones).
2. **Combined each dataset into one clean table per topic** (one for financials, one for quality, one for penalties, etc.).
3. **Merged everything together** into a single master table, matching each facility by its unique ID and the year.
4. **Fixed uneven reporting periods** — some facilities filed reports for partial years instead of a full year, so I scaled their numbers to represent a full year, making everyone comparable.
5. **Filled in missing details** (like facility name) using that facility's information from other years.
6. **Removed duplicates and incomplete records** — dropped ~80 facilities that had no usable address/location info.
7. **Exported one clean, ready-to-use file**: `Clean_nursing_data.csv` — about 99,300 rows.

**Tools used:** Python, pandas, Jupyter Notebook

---

## 📊 The Dashboard (3 Pages, Built in Tableau)

### 1. Overview
The big picture — total facilities, average ratings, revenue, and income trends from 2015–2021, plus a map of where facilities are located.

![Overview]<img width="944" height="569" alt="Screenshot 2026-08-11 at 9 20 45 PM" src="https://github.com/user-attachments/assets/e7cd3d04-824e-4412-8129-7f46f2cef0c2" />


### 2. Geography
Where the opportunities are — top states by profitability, top states by aging population, and a rural vs. urban comparison.

![Geography](images/dashboard_geography.png)

### 3. Finance
A closer look at financial health — profit margins, debt levels, labor costs, and a state-by-state financial performance table.

![Finance](images/dashboard_finance.png)

**[🔗 View the live dashboard on Tableau Public](#)** <!-- add your link here -->

---

## 💡 Key Takeaways

- **Profit margins are thin.** Facilities average $12.4M in revenue but only about $68K in net income — a tiny margin.
- **Most facilities are for-profit**, which affects both risk and quality ratings compared to non-profit or government-run homes.
- **High-demand states aren't always the most profitable ones.** States like Maine, Florida, and West Virginia have the oldest populations, but they aren't necessarily the top states for net income — a potential opportunity gap for investors.
- **Urban facilities outnumber rural ones by more than 2-to-1** (~11,100 vs. ~4,400), which affects staffing and costs differently.
- **2020 was a rough year financially** across the board, most likely due to COVID-19's impact on occupancy and costs.

---

## 🛠️ Tools Used

- **Python** (pandas) — cleaning and combining the data
- **Jupyter Notebook** — where the cleaning code lives
- **Tableau** — building the interactive dashboard
- **CMS.gov** — where the raw data came from

---

## 📁 What's in This Repo

```
├── Data_Cleaning.ipynb     → the code that cleans and combines all the data
├── dashboards/              → PDF exports of the 3 dashboard pages
├── images/                  → screenshots used in this README
└── README.md
```

📌 Note: the raw data files aren't included here (too large for GitHub), but they're publicly available at [data.cms.gov](https://data.cms.gov/).

---

## 🔮 What I'd Add Next

- Bring in newer data as CMS releases it, to see how the industry recovered after COVID.
- Build a simple "risk score" for each facility based on finances, ratings, and penalty history.
- Try predicting which facilities are likely to become financially distressed.

---

## 👤 Author

**[Your Name]**
Data Analyst / Data Scientist
[LinkedIn](#) · [Portfolio](#) · [Email](#)
