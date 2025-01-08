# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis   
**Database**: `sql_project_1`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project_1`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql

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
```

## 3. Data Analysis & Findings

### SQL Queries
The following SQL queries were developed to answer specific business questions:

1. **Retrieve all columns for sales made on '2022-11-05':**
    ```sql
    SELECT *
    FROM retail_sales
    WHERE sale_date = '2022-11-05';
    ```

2. **Retrieve transactions where the category is 'Clothing' and the quantity sold is more than 4 in November 2022:**
    ```sql
    SELECT *
    FROM retail_sales
    WHERE category = 'Clothing'
      AND quantity >= 4
      AND EXTRACT(MONTH FROM sale_date) = 11
      AND EXTRACT(YEAR FROM sale_date) = 2022;
    ```

3. **Calculate total sales for each category:**
    ```sql
    SELECT category,
           SUM(total_sale) AS total_sales
    FROM retail_sales
    GROUP BY category
    ORDER BY total_sales DESC;
    ```

4. **Find the average age of customers who purchased items from the 'Beauty' category:**
    ```sql
    SELECT AVG(age) AS average_age
    FROM retail_sales
    WHERE category = 'Beauty';
    ```

5. **Retrieve transactions where the total sale is greater than 1000:**
    ```sql
    SELECT *
    FROM retail_sales
    WHERE total_sale > 1000;
    ```

6. **Find the total number of transactions by each gender in each category:**
    ```sql
    SELECT gender,
           category,
           COUNT(transaction_id) AS total_transactions
    FROM retail_sales
    GROUP BY gender, category
    ORDER BY total_transactions DESC;
    ```

7. **Calculate the average sale for each month and identify the best-selling month in each year:**
    ```sql
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS average_sale
    FROM retail_sales
    GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
    ORDER BY year, average_sale DESC;
    ```

8. **Find the top 5 customers based on the highest total sales:**
    ```sql
    SELECT customer_id,
           SUM(total_sale) AS total_sales
    FROM retail_sales
    GROUP BY customer_id
    ORDER BY total_sales DESC
    LIMIT 5;
    ```

9. **Find the number of unique customers who purchased items from each category:**
    ```sql
    SELECT category,
           COUNT(DISTINCT customer_id) AS unique_customers
    FROM retail_sales
    GROUP BY category
    ORDER BY unique_customers DESC;
    ```

10. **Group transactions by shifts and count orders (Morning, Afternoon, Evening):**
    ```sql
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
    ```

### Findings

- **Customer Demographics:**
  - Customers of various age groups contribute to sales, with significant interest in categories like Clothing and Beauty.

- **High-Value Transactions:**
  - Transactions exceeding 1000 in total sales highlight premium purchases.

- **Sales Trends:**
  - Monthly analysis reveals sales variations, helping identify peak seasons and best-selling months.

- **Customer Insights:**
  - Top-spending customers and unique customer counts for each category provide targeted insights.

### Reports

1. **Sales Summary:**
   - A comprehensive report detailing total sales, customer demographics, and category performance.

2. **Trend Analysis:**
   - Insights into sales trends across different months and shifts.

3. **Customer Insights:**
   - Reports highlighting top customers and unique customer counts per category.

## Conclusion

This project showcases the use of SQL for data analysis, encompassing database setup, data cleaning, exploratory data analysis, and business-driven queries. The findings provide actionable insights to improve sales strategies and understand customer behavior. This repository serves as a valuable resource for aspiring data analysts.

