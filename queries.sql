-- =========================================
-- E-Commerce Order Management: Practice Queries
-- =========================================

USE ecommerce_db;

-- 1. Basic filtering: customers from a specific city
SELECT * FROM customers WHERE city = 'Hyderabad';

-- 2. Basic filtering: products under a price threshold
SELECT product_name, price FROM products WHERE price < 500;

-- 3. Join: full order details with customer & product names
SELECT o.order_id, c.name, p.product_name, oi.quantity, oi.unit_price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- 4. Aggregation: total revenue per customer
SELECT c.name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- 5. Aggregation: best-selling products
SELECT p.product_name, SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 5;

-- 6. Subquery: customers who spent above average
SELECT customer_id, total_spent FROM (
    SELECT o.customer_id, SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
) t
WHERE total_spent > (
    SELECT AVG(total_spent) FROM (
        SELECT SUM(oi.quantity * oi.unit_price) AS total_spent
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) avg_sub
);

-- 7. Window function: rank customers by total spend
SELECT c.name,
       SUM(oi.quantity * oi.unit_price) AS spent,
       RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS rnk
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name;
