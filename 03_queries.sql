-- 03_queries.sql
-- Practical SQL and analytics queries

-- 1. View all products with their categories
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.product_id;

-- 2. Show every category and its product count
SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC;

-- 3. Customers and their order counts
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY order_count DESC;

-- 4. Completed revenue
SELECT
    SUM(total_amount) AS completed_revenue
FROM orders
WHERE status = 'Completed';

-- 5. Revenue by category
SELECT
    c.category_name,
    SUM(oi.line_total) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY c.category_name
ORDER BY revenue DESC;

-- 6. Products generating more than 5000 in sales
SELECT
    p.product_name,
    SUM(oi.line_total) AS product_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.line_total) > 5000
ORDER BY product_revenue DESC;

-- 7. Top customers by completed spending
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- 8. Low-stock products
SELECT
    p.product_name,
    i.quantity,
    i.reorder_level
FROM products p
JOIN inventory i
    ON p.product_id = i.product_id
WHERE i.quantity <= i.reorder_level
ORDER BY i.quantity;

-- 9. Average completed order value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE status = 'Completed';

-- 10. Orders above the average order value
SELECT
    order_id,
    customer_id,
    total_amount
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
)
ORDER BY total_amount DESC;

-- 11. Monthly sales
SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'Completed'
GROUP BY sales_month
ORDER BY sales_month;

-- 12. Rank products by revenue
SELECT
    p.product_name,
    SUM(oi.line_total) AS revenue,
    RANK() OVER (ORDER BY SUM(oi.line_total) DESC) AS revenue_rank
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY revenue_rank;
