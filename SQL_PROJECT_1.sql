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

--The following SQL queries were developed to answer specific business questions:

-- **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';


--**Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
SELECT * 
FROM retail_sales 
WHERE category = 'Clothing' 
  AND quantiy >= 4
  AND EXTRACT(MONTH FROM sale_date) = 11
  AND EXTRACT(YEAR FROM sale_date) = 2022;

--**Write a SQL query to calculate the total sales (total_sale) for each category.**:
SELECT category, 
       SUM(total_sale) AS total_sales 
FROM retail_sales 
GROUP BY category
ORDER BY total_sales DESC;

--**Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
SELECT AVG(age) AS average_age 
FROM retail_sales 
WHERE category = 'Beauty';

--**Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
SELECT * 
FROM retail_sales 
WHERE total_sale > 1000;

--**Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
SELECT gender, 
       category, 
       COUNT(transaction_id) AS total_transactions 
FROM retail_sales 
GROUP BY gender, category
ORDER BY total_transactions DESC;

--**Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year, 
    EXTRACT(MONTH FROM sale_date) AS month, 
    AVG(total_sale) AS average_sale 
FROM retail_sales 
GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
ORDER BY year, average_sale DESC;

--**Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT customer_id, 
       SUM(total_sale) AS total_sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY total_sales DESC 
LIMIT 5;

--**Write a SQL query to find the number of unique customers who purchased items from each category.**:
SELECT category, 
       COUNT(DISTINCT customer_id) AS unique_customers 
FROM retail_sales 
GROUP BY category
ORDER BY unique_customers DESC;

--**Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders 
FROM retail_sales 
GROUP BY 
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY total_orders DESC;





