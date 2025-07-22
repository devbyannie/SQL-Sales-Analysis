-- 3a. Top 10 Best-Selling Products
SELECT
    "Product Name",
    SUM("Sales") AS total_revenue
FROM sales
GROUP BY "Product Name"
ORDER BY total_revenue DESC
LIMIT 10;