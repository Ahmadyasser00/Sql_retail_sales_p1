-- SQL Retail Sales Analysis
CREATE DATABASE SQL_PROJECT_1;


-- CREATE Table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales 
          (
			transactions_id INT PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,
			customer_id INT,
			gender VARCHAR(15),
			age	INT,
			category VARCHAR(15),
			quantiy INT,
			price_per_unit	FLOAT,
			cogs FLOAT,
			total_sale FLOAT
           );
--DATA CLEANING
select * from retail_sales
where transactions_id is null 
    or sale_date is null
    or sale_time is null
	or customer_id is null
	or gender is null
	or age is null
	or category is null
	or quantiy is null
	or price_per_unit is null
	or cogs is null
	or total_sale is null
	--
	DELETE FROM retail_sales
	where transactions_id is null 
    or sale_date is null
    or sale_time is null
	or customer_id is null
	or gender is null
	or age is null
	or category is null
	or quantiy is null
	or price_per_unit is null
	or cogs is null
	or total_sale is null
	select 
	count(*)
	from retail_sales
	--DATA EXPLORATION
-- How many customers we have?
select count(*) as total_sales from retail_sales 
-- How many unique customers we have?
select count(DISTINCT customer_id) as total_sales from retail_sales 

select count( DISTINCT category) from retail_sales 
-- Data analysis & business key & problems & Answers


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * 
from retail_sales
where sale_date ='2022-11-05' ;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,
  sum(total_sale) as net_sale,
  COUNT(*) as total_orders
 from retail_sales
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select 
round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale>1000
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category,
gender,
count(*) as total_trans
from retail_sales
group 
by 
category,
gender
ORDER BY category
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from
(
select
 EXTRACT(year from sale_date) as year,
  EXTRACT(month from sale_date) as month,
  avg(total_sale) as avg_sale,
  Rank() over(PARTITION by EXTRACT(year from sale_date) order by AVG(total_sale) Desc)
  FROM retail_sales
  GROUP BY 1 ,2
  )as t1
  where rank = 1
  -- End of project
