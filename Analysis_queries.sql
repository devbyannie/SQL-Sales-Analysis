-- 1. Overall Sales Performance
SELECT
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit,
    (SUM("Profit") / SUM("Sales")) * 100 AS profit_margin
FROM sales;


-- 2. Monthly Sales Trend (Corrected for Date Format)
SELECT
    TO_CHAR(TO_DATE("Order Date", 'MM/DD/YYYY'), 'YYYY-MM') AS sales_month,
    SUM("Sales") AS monthly_sales
FROM sales
GROUP BY sales_month
ORDER BY sales_month;


-- 3a. Top 10 Best-Selling Products
SELECT
    "Product Name",
    SUM("Sales") AS total_revenue
FROM sales
GROUP BY "Product Name"
ORDER BY total_revenue DESC
LIMIT 10;


-- 3b. Most Profitable Categories
SELECT
    "Category",
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit
FROM sales
GROUP BY "Category"
ORDER BY total_profit DESC;


-- 4. Customer Segmentation Analysis
WITH customer_spending AS (
    SELECT
        "Customer Name",
        SUM("Sales") AS total_spent
    FROM sales
    GROUP BY "Customer Name"
)
SELECT
    "Customer Name",
    total_spent,
    CASE
        WHEN total_spent > 5000 THEN 'High-Value Customer'
        WHEN total_spent > 1000 THEN 'Mid-Value Customer'
        ELSE 'Low-Value Customer'
    END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC;