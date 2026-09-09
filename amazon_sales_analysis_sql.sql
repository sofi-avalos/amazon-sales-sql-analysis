-- Preview of the dataset
SELECT * FROM amazon_sales LIMIT 10;


-- ==============================
-- DATASET OVERVIEW
-- ==============================

-- How many total rows (sales records) are in the dataset?
SELECT COUNT(*) AS total_records
FROM amazon_sales;

-- How many unique SKUs were sold?
SELECT COUNT(DISTINCT sku) AS total_skus
FROM amazon_sales;

-- How many different order statuses are there, and what are they?
SELECT 
    status, 
    COUNT(*) AS total_records
FROM amazon_sales
GROUP BY status
ORDER BY total_records DESC;


-- ==============================
-- SALES OVERVIEW
-- ==============================

-- What is the total revenue generated across all sales?
SELECT SUM(amount) AS total_revenue
FROM amazon_sales;
-- Revenue calculations exclude records where amount is NULL.

-- What is the average sales amount per transaction?
SELECT ROUND(AVG(amount), 2) AS average_amount
FROM amazon_sales;

-- Which month had the highest total sales revenue?
SELECT 
    TO_CHAR(TO_DATE(date, 'MM-DD-YY'), 'MM-YYYY') AS month, 
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 1;

-- Which product category had the highest total quantity sold?
SELECT 
    category, 
    SUM(qty) AS total_quantity
FROM amazon_sales
GROUP BY category
ORDER BY total_quantity DESC
LIMIT 1;


-- ==============================
-- PRODUCT ANALYSIS
-- ==============================

-- What are the top 5 most sold SKUs based on quantity?
SELECT 
    sku, 
    SUM(qty) AS total_quantity_sold
FROM amazon_sales
GROUP BY sku
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- How many sales were made for each product size?
SELECT 
    size, 
    COUNT(*) AS total_sales
FROM amazon_sales
GROUP BY size
ORDER BY size;


-- ==============================
-- BUSINESS ANALYSIS
-- ==============================

-- How many sales were B2B transactions vs non-B2B?
SELECT 
    COUNT(CASE WHEN CAST(b2b AS boolean) = true THEN 1 END) AS b2b_transactions,
    COUNT(CASE WHEN CAST(b2b AS boolean) = false THEN 1 END) AS non_b2b_transactions
FROM amazon_sales;

-- Which fulfilment method was used most frequently?
SELECT 
    fulfilment, 
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY fulfilment
ORDER BY total_orders DESC
LIMIT 1;


-- ==============================
-- DATA QUALITY INVESTIGATION
-- ==============================

-- How many records have missing sales amounts?
SELECT COUNT(*) AS missing_amounts
FROM amazon_sales
WHERE amount IS NULL;

-- How many records have missing quantities?
SELECT COUNT(*) AS missing_quantities
FROM amazon_sales
WHERE qty IS NULL;

-- Which order statuses have missing sales amounts?
SELECT 
    status,
    COUNT(*) AS records,
    COUNT(amount) AS records_with_amount,
    COUNT(*) - COUNT(amount) AS records_without_amount
FROM amazon_sales
GROUP BY status
ORDER BY records_without_amount DESC;
-- Most missing amount values occur in cancelled transactions.

-- What is the total sales amount for each order status?
SELECT 
    status,
    COUNT(*) AS total_records,
    SUM(amount) AS total_sales_amount
FROM amazon_sales
GROUP BY status
ORDER BY total_sales_amount DESC;

-- Which product categories generated the highest sales amount?
SELECT category, SUM(amount) AS total_sales_amount
FROM amazon_sales
GROUP BY category
ORDER BY total_sales_amount DESC
LIMIT 1;

