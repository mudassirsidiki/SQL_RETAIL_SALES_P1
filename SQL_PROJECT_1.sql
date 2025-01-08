-- PROJECT NAME = SQL RETAIL SALES ANALYSIS


--------------------
-- CREATING DATABASE
--------------------
CREATE DATABASE SQL_PROJECT_1;


------------------
-- CREATEING TABLE
------------------
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales(
      transaction_id INT PRIMARY KEY,
      sale_date DATE,
	  sale_time TIME,	
	  customer_id INT, 	
	  gender VARCHAR(20),	
	  age INT,	
	  category VARCHAR(20),	
	  quantiy INT,	
	  price_per_unit FLOAT,	
	  cogs FLOAT,	
	  total_sale FLOAT);


----------------------------------------
-- DATA CLEANING BY REMOVING NULL VALUES
----------------------------------------
SELECT * FROM retail_sales
WHERE 
transaction_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
gender  IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;


-----------------------
-- DELETING NULL VALUES
-----------------------
DELETE FROM retail_sales
WHERE 
transaction_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
gender  IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;


-------------------
-- DATA EXPLORATION 
-------------------

-- HOW MANY SALES WE HAVE?
SELECT SUM(total_sale) AS total_sales FROM retail_sales;
-- 911720

-- HOW MANY CUSTOMERS WE HAVE?
SELECT COUNT(customer_id) AS total_customers FROM retail_sales;
-- 1997

-- HOW MANY UNIQUE CUSTOMERS WE HAVE?
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;
-- 155


------------------------------------------
-- DATA ANALYSIS AND BUSINESS KEY PROBLEMS 
------------------------------------------





