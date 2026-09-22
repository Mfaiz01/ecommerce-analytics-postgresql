-- 04_views.sql
-- Reusable analytical views

CREATE OR REPLACE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(
        CASE WHEN o.status = 'Completed' THEN o.total_amount ELSE 0 END
    ), 0) AS completed_spend
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name;

CREATE OR REPLACE VIEW product_sales_summary AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COALESCE(SUM(
        CASE WHEN o.status <> 'Cancelled' THEN oi.quantity ELSE 0 END
    ), 0) AS units_sold,
    COALESCE(SUM(
        CASE WHEN o.status <> 'Cancelled' THEN oi.line_total ELSE 0 END
    ), 0) AS revenue
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN orders o
    ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name, c.category_name;

CREATE OR REPLACE VIEW low_stock_products AS
SELECT
    p.product_id,
    p.product_name,
    i.quantity,
    i.reorder_level
FROM products p
JOIN inventory i
    ON p.product_id = i.product_id
WHERE i.quantity <= i.reorder_level;

-- Test views
SELECT * FROM customer_order_summary ORDER BY completed_spend DESC;
SELECT * FROM product_sales_summary ORDER BY revenue DESC;
SELECT * FROM low_stock_products ORDER BY quantity;
