
CREATE DATABASE IF NOT EXISTS nursing_homes;
USE nursing_homes;

DROP TABLE IF EXISTS nursing_home_data;

CREATE TABLE nursing_home_data (
    provnum                         VARCHAR(20),
    year                             INT,
    provname                        VARCHAR(255),
    address                          VARCHAR(255),
    city                             VARCHAR(100),
    state                            VARCHAR(10),
    zip                              VARCHAR(20),
    ownership                        VARCHAR(100),
    rural_versus_urban              VARCHAR(20),
    number_of_beds                  INT,
    overall_rating                  DECIMAL(3,2),
    quality_rating                  DECIMAL(3,2),
    staffing_rating                 DECIMAL(3,2),
    survey_rating                   DECIMAL(3,2),
    total_bed_days_available        BIGINT,
    total_discharges_total          INT,
    less_total_operating_expense    DECIMAL(18,2),
    salaries_wages_and_fees_payable DECIMAL(18,2),
    total_liab_and_fund_balances    DECIMAL(18,2),
    total_salaries_adjusted         DECIMAL(18,2),
    total_fund_balances             DECIMAL(18,2),
    annualized_gross_revenue        DECIMAL(18,2),
    annualized_inpatient_revenue    DECIMAL(18,2),
    annualized_net_income           DECIMAL(18,2),
    annualized_net_patient_revenue  DECIMAL(18,2),
    annualized_total_assets         DECIMAL(18,2),
    annualized_total_costs          DECIMAL(18,2),
    annualized_total_income         DECIMAL(18,2),
    annualized_total_liabilities    DECIMAL(18,2)
);


-- LOAD THE DATA
 

-- SET GLOBAL local_infile = 1;
 
-- LOAD DATA LOCAL INFILE '/Users/brandonnguyen/Desktop/ACE_project/Clean_nursing_data.csv'
-- INTO TABLE nursing_home_data
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;



-- DASHBOARD AGGREGATION QUERIES

--  Average net income by state
SELECT
    state,
    ROUND(AVG(annualized_net_income), 2) AS avg_net_income
FROM nursing_home_data
GROUP BY state
ORDER BY avg_net_income DESC;


-- Top 10 states by average net income
SELECT
    state,
    ROUND(AVG(annualized_net_income), 2) AS avg_net_income
FROM nursing_home_data
GROUP BY state
ORDER BY avg_net_income DESC
LIMIT 10;


-- Count of rural vs. urban facilities
SELECT
    rural_versus_urban,
    COUNT(*) AS facility_count
FROM nursing_home_data
GROUP BY rural_versus_urban;


 
-- AD-HOC INVESTIGATION: WHY WAS 2018 NET INCOME SO LOW?
-- ------------------------------------------------------------

-- Facilities with negative net income in 2018 (worst first)
SELECT
    provnum,
    provname,
    state,
    ownership,
    annualized_net_income
FROM nursing_home_data
WHERE year = 2018
  AND annualized_net_income < 0
ORDER BY annualized_net_income ASC;


-- Is the 2018 loss concentrated ? — by state
SELECT
    state,
    COUNT(*) AS num_facilities,
    SUM(CASE WHEN annualized_net_income < 0 THEN 1 ELSE 0 END) AS num_losing_money,
    ROUND(
        100.0 * SUM(CASE WHEN annualized_net_income < 0 THEN 1 ELSE 0 END) / COUNT(*),
        1
    ) AS pct_losing_money
FROM nursing_home_data
WHERE year = 2018
GROUP BY state
ORDER BY pct_losing_money DESC;


-- Is the 2018 loss concentrated ? — by ownership type
SELECT
    ownership,
    COUNT(*) AS num_facilities,
    ROUND(AVG(annualized_net_income), 2) AS avg_net_income,
    MIN(annualized_net_income) AS worst_case
FROM nursing_home_data
WHERE year = 2018
GROUP BY ownership
ORDER BY avg_net_income ASC;
