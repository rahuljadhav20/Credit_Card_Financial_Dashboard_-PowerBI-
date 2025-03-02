--- SQL Queries to Create & Import Data from CSV files:

--1.Creating Database 


CREATE DATABASE ccdb;

--2. Creating Credit_Card_Data Table

CREATE TABLE Credit_Card_Data (
    Client_Num BIGINT,
    Card_Category VARCHAR(50),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE, -- Store as DATE
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


--3. Creating cust_detail table

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


--5. Importing CSV data into SQL 

--i) First importing data to the "Credit_Card_Data" table

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


--ii) Importing data to the "cust_detail" table

BULK INSERT cust_detail  
FROM 'E:\DA Material\Power BI\Projects\Finance Data Dashboard\customer.csv'  
WITH (  
    FORMAT = 'CSV',  
    FIRSTROW = 2,  -- Skip header row  
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',  
    TABLOCK,  
    CODEPAGE = '65001'  -- Ensures UTF-8 support
);

--- View all imported data

select * from cust_detail;

select * from Credit_Card_Data;


--EXEC sp_help 'cust_detail' -> sp_help is a system-stored procedure in SQL Server that provides detailed information about a database object (such as a table, view, or stored procedure)
