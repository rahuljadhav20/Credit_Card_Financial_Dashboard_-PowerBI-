# Credit_Card_Financial_Dashboard_-PowerBI-

**Introduction :**

This project analyzes credit card transactions and customer behavior using Power BI. The goal is to identify spending patterns, credit utilization trends, and churn probability to help financial institutions make data-driven decisions.
Data Source/Files:  https://github.com/rahuljadhav20/Credit_Card_Financial_Dashboard_-PowerBI-/tree/main/Data
The dataset consists of two files:
Credit Card Data (CSV): Contains transaction details, credit limits, utilization ratios, and delinquency status.
Customer Data (CSV): Includes demographics, income levels, and satisfaction scores.

Background:
According to my understanding, customer retention is generally more cost-effective than customer acquisition. Moreover, my keen interest lies in identifying patterns, which strongly motivates me to delve deeper into this project.

=========================================================================================================================================================================================================================

**Data Preparation :**
SQL Implementation for Data Preparation

1) Database & Table Creation
To store and analyze credit card transactions and customer details, I created a database and structured tables:
-- Create the database
CREATE DATABASE ccdb;
-- Create Credit Card Transactions Table
CREATE TABLE Credit_Card_Data (
Client_Num BIGINT,
Card_Category VARCHAR(50),
Annual_Fees INT,
Activation_30_Days INT,
Customer_Acq_Cost INT,
Week_Start_Date DATE,
Week_Num VARCHAR(20),
Qtr VARCHAR(5),
current_year INT,
Credit_Limit FLOAT,
Total_Revolving_Bal INT,
Total_Trans_Amt INT,
Total_Trans_Vol INT,
Avg_Utilization_Ratio FLOAT,
Use_Chip VARCHAR(20),
Exp_Type VARCHAR(50),
Interest_Earned FLOAT,
Delinquent_Acc INT
);
-- Create Customer Details Table
CREATE TABLE cust_detail (
Client_Num INT,
Customer_Age INT,
Gender VARCHAR(5),
Dependent_Count INT,
Education_Level VARCHAR(50),
Marital_Status VARCHAR(20),
State_cd VARCHAR(50),
Zipcode VARCHAR(20),
Car_Owner VARCHAR(5),
House_Owner VARCHAR(5),
Personal_Loan VARCHAR(5),
Contact VARCHAR(50),
Customer_Job VARCHAR(50),
Income INT,
Cust_Satisfaction_Score INT
);

2) Data Import from CSV Files
After table creation, I used BULK INSERT to load data from CSV files into SQL Server:
-- Import data into Credit Card Transactions Table
BULK INSERT Credit_Card_Data
FROM 'E:\DA Material\Power BI\Projects\Finance Data Dashboard\credit_card.csv'
WITH (
FORMAT = 'CSV',
FIRSTROW = 2,  -- Skip header row
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
CODEPAGE = '65001'  -- Ensures UTF-8 support
);

-- Import data into Customer Details Table
BULK INSERT cust_detail
FROM 'E:\DA Material\Power BI\Projects\Finance Data Dashboard\customer.csv'
WITH (
FORMAT = 'CSV',
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
CODEPAGE = '65001'
);

3) Data Validation & Exploration
To ensure data integrity, I validated the imported data using:
-- View imported customer data
SELECT * FROM cust_detail;
-- View imported credit card transaction data
SELECT * FROM Credit_Card_Data;
-- Get table structure and metadata
EXEC sp_help 'cust_detail';
EXEC sp_help 'Credit_Card_Data';
--EXEC sp_help 'cust_detail' -> sp_help is a system-stored procedure in SQL Server that provides detailed information about a database object (such as a table, view, or stored procedure)

=========================================================================================================================================================================================================================
**Dashboard Development :**
 
After preparing the dataset and transforming it in SQL Server, I connected the data to Power BI to develop an interactive Credit Card Customer & Transaction Dashboard. The dashboard focuses on customer segmentation, spending behavior, credit utilization, and churn risk analysis.

1.  Data Modeling & Structure :
To ensure an optimized and structured model :
Created relationships between Credit Card Transactions (Credit_Card_Data) and Customer Details (cust_detail) using Client_Num as the primary key.

2. DAX Implementation:
Organized measures and calculated columns into separate folders for better maintainability.
I implemented key calculated columns and measures to drive meaningful insights in the dashboard:
A] Measure used:
i) Revenue & Performance Analysis:
Revenue = Sum of Annual Fees, Total Transaction Amount, and Interest Earned
Current_Week_Revenue = Revenue for the latest week in the dataset

Previous_Week_Revenue = Revenue for the previous week

WOW_Revenue% = Week-over-Week revenue change (%)

B] Calculated Columns used:
i) Customer Segmentation:
AgeGroup
= Categorized customers into 20-30, 30-40, 40-50, 50-60, 60+.

Month_Name & Week_Number:

IncomeGroup = Grouped income levels into Low, Mid, and High

Transaction_Frequency_Category = Segmented users into Occasional, Regular, and High-Frequency

ii) Risk & Utilization Analysis:
Churn_Risk = Identified customers at Low, Medium, and High Risk based on spending and utilization ratio


=========================================================================================================================================================================================================================

**Result :**

1. Week-over-Week Revenue Fluctuations
The dashboard shows inconsistent week-over-week revenue changes, with some weeks showing positive growth, while others experience decline.
The highest revenue-generating weeks should be further analyzed for seasonal trends or promotional impacts.
2. The Regular transaction category accounts for the highest total spending, and specifically, 'Blue' card holders are contributing more, followed by High-Frequency transactions, while Occasional transactions contribute the least. This indicates that customers who transact more frequently tend to generate higher total transaction amounts, making them the most valuable segment. Churn Risk is Higher for Customers with Low Transactions
3. Credit Utilization Distribution Across Customers
The majority of customers fall under Moderate Credit Utilization (30%-70%), with fewer customers in High Utilization (>70%).
Low Utilization Customers may indicate either high-income customers who don't rely on credit or inactive customers.
4. Revenue Contribution by Age Group
Customers aged 30-50 contribute the highest revenue, making them the most financially active segment.
Customers under 30 and over 60 contribute significantly less to total revenue.
