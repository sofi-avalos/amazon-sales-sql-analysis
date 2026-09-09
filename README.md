# Amazon Sales SQL Analysis

## Project Overview

This project explores an Amazon sales dataset using PostgreSQL and SQL.

It originally started as a SQL assignment on an online learning platform, focused on practicing SQL fundamentals through a series of questions about an e-commerce sales dataset.

After completing the original requirements, I expanded the project into a personal portfolio project by adding additional exploratory questions and basic data quality checks to investigate the dataset further.

The analysis focuses on sales performance, products, order statuses, fulfilment methods, B2B transactions, and data quality.

## Dataset

The dataset used in this project is the **E-Commerce Sales Dataset**, published on Kaggle by **The Devastator**.

The specific file used for the analysis is:

**`Amazon Sale Report.csv`**

The dataset is available in two places:

* **This repository:** `data/Amazon Sale Report.zip`
* **Original source:** [E-Commerce Sales Dataset — Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data)

The CSV file is included inside the ZIP file in the `data/` folder.

The dataset contains information such as:

* Product categories
* SKUs
* Product sizes
* Sale dates
* Order statuses
* Fulfilment methods
* Quantities
* Sales amounts
* B2B transactions

The original dataset source is credited above. Please refer to the Kaggle page for the dataset's original description, licensing, and usage information.

## Objectives

The analysis focuses on questions such as:

* How many sales records are in the dataset?
* How many unique SKUs were sold?
* What are the different order statuses?
* What is the total recorded sales amount?
* What is the average sales amount per transaction?
* Which month had the highest recorded sales amount?
* Which product category had the highest quantity sold?
* Which product category generated the highest sales amount?
* What are the top 5 SKUs based on quantity sold?
* How many sales were made for each product size?
* How many transactions were B2B vs non-B2B?
* Which fulfilment method was used most frequently?
* How many records contain missing sales amounts?
* Are there missing values in the quantity field?
* Which order statuses contain missing sales amounts?
* What is the total sales amount for each order status?

## Key Findings

The analysis produced several notable results:

* The dataset contains **128,975 sales records**.
* There are **7,195 unique SKUs**.
* The total recorded sales amount is approximately **€78.59 million**.
* The average recorded sales amount per transaction is **€648.56**.
* `Set` was the product category with the highest total quantity sold, with **45,289 units**.
* The highest recorded monthly sales amount occurred in **April 2022**, with approximately **€28.84 million**.
* `Amazon` was the most frequently used fulfilment method, with **89,698 records**.
* There were **871 B2B transactions** and **128,104 non-B2B transactions**.
* The five SKUs with the highest total quantities sold were identified through aggregation by SKU.

## Data Quality Investigation

During the analysis, missing values were identified in the `amount` field.

There are **7,795 records with a missing amount**, while the `qty` field contains **no missing values**.

A further investigation showed that the majority of missing `amount` values are associated with cancelled transactions. Specifically, **7,566 of the 7,795 missing amounts** occur in records with a `Cancelled` status.

This represents approximately **97% of all missing `amount` values**.

Because PostgreSQL ignores `NULL` values when calculating `SUM()` and `AVG()`, the reported sales amount and average are based only on records where `amount` is available.

This was taken into consideration when interpreting the results.

## SQL Concepts Used

The project uses fundamental SQL concepts including:

* `SELECT`
* `WHERE`
* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`
* `DISTINCT`
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* `CASE WHEN`
* `CAST()`
* Date conversion with `TO_DATE()`
* Date formatting with `TO_CHAR()`

## Tools

* PostgreSQL
* pgAdmin
* SQL

## Repository Structure

```text
amazon-sales-sql-analysis/
│
├── README.md
│
├── data/
│   └── Amazon Sale Report.zip
│
└── sql/
    └── amazon_sales_analysis_sql.sql
```

## What I Learned

This project helped me practice SQL fundamentals using a real-world-style e-commerce dataset and understand how SQL can be used to investigate data rather than simply retrieve information.

It also gave me practice identifying missing values and investigating where those missing values occur before interpreting aggregated results.

Most importantly, I learned that even relatively simple SQL queries can be used to answer practical business questions and uncover issues in a dataset.
