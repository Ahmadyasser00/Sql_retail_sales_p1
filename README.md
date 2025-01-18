# Retail Sales Analysis SQL Project 

## Project Overview  

**Project Title**: Retail Sales Analysis  
**Difficulty Level**: Beginner to Intermediate  
**Database Name**: `p1_retail_db`  

This project demonstrates practical SQL skills for analyzing retail sales data, including database setup, data cleaning, exploratory data analysis (EDA), and answering specific business questions. Designed for beginners and SQL enthusiasts, the project provides a solid foundation in querying, cleaning, and deriving insights from structured data.  

---

## Objectives  

1. **Database Setup**: Create and populate a retail sales database to organize and analyze sales data effectively.  
2. **Data Cleaning**: Identify and handle missing or null values to ensure data quality.  
3. **Exploratory Data Analysis (EDA)**: Explore key statistics, unique values, and patterns in the dataset.  


---

## Project Structure  

### 1. Database Setup  

- **Database Creation**:  
The database is named `p1_retail_db`.  

- **Table Design**:  
The `retail_sales` table captures critical sales attributes, including customer demographics, product details, and financial metrics.  

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```


### 2. Data Exploration & Cleaning  

#### Exploration  
Understand the dataset's size, unique customer count, and product categories.  

#### Null Handling  
Identify and delete records with missing values to maintain data integrity.  
د
-- Count total records
```sql
SELECT COUNT(*) FROM retail_sales;
```
-- Count unique customers
```sql
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
```
-- List unique categories
```sql
SELECT DISTINCT category FROM retail_sales;
```
-- Identify records with null values
```sql
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
-- Remove null records
```sql
DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
### 3. Data Analysis & Insights
Below are SQL queries developed to answer specific business questions:
**Query 1**: Retrieve all sales made on '2022-11-05'
```sql
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';
```
**Query 2**: Retrieve transactions for 'Clothing' where quantity > 4 in November 2022
```sql
SELECT * 
FROM retail_sales 
WHERE category = 'Clothing' 
    AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' 
    AND quantity > 4;
```
**Query 3**: Total sales by category
```sql
SELECT 
    category, 
    SUM(total_sale) AS total_sales, 
    COUNT(*) AS total_orders 
FROM retail_sales 
GROUP BY category;
```
**Query 4**: Average age of customers who purchased 'Beauty' products
```sql
SELECT 
    ROUND(AVG(age), 2) AS avg_age 
FROM retail_sales 
WHERE category = 'Beauty';
```
**Query 5**: Find transactions where total_sale > 1000
```sql
SELECT * 
FROM retail_sales 
WHERE total_sale > 1000;
```
**Query 6**: Transactions count by gender in each category
```sql
SELECT 
    category, 
    gender, 
    COUNT(*) AS total_transactions 
FROM retail_sales 
GROUP BY category, gender 
ORDER BY category;
```
**Query 7**: Best-selling month each year based on average sales
```sql
SELECT 
    year, 
    month, 
    avg_sale 
FROM (  
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year, 
        EXTRACT(MONTH FROM sale_date) AS month, 
        AVG(total_sale) AS avg_sale, 
        RANK() OVER (PARTITION BY EX
```
Feel free to reach out to me if you have any questions or suggestions!
- GitHub: Ahmedyasser00
