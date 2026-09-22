-- 02_seed_data.sql
-- Sample data for E-Commerce Sales & Inventory Analytics

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Consumer electronics and accessories'),
('Laptops', 'Laptops and computing devices'),
('Mobile Phones', 'Smartphones and mobile devices'),
('Home Appliances', 'Appliances for home use'),
('Accessories', 'Computer and mobile accessories');

INSERT INTO products (category_id, product_name, price, stock_quantity) VALUES
(1, 'Wireless Headphones', 2499.00, 45),
(1, 'Bluetooth Speaker', 1899.00, 30),
(2, 'Business Laptop', 64999.00, 12),
(2, 'Gaming Laptop', 89999.00, 8),
(3, 'Android Smartphone', 24999.00, 25),
(3, 'Budget Smartphone', 12999.00, 40),
(4, 'Air Fryer', 5999.00, 18),
(4, 'Coffee Maker', 4499.00, 15),
(5, 'Wireless Mouse', 899.00, 60),
(5, 'Mechanical Keyboard', 3499.00, 22);

INSERT INTO inventory (product_id, quantity, reorder_level) VALUES
(1, 45, 10),
(2, 30, 8),
(3, 12, 5),
(4, 8, 5),
(5, 25, 8),
(6, 40, 10),
(7, 18, 5),
(8, 15, 5),
(9, 60, 15),
(10, 22, 8);

INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('Ahmed', 'Khan', 'ahmed.khan@example.com', '9876500001', 'Mysore'),
('Priya', 'Sharma', 'priya.sharma@example.com', '9876500002', 'Bangalore'),
('Rahul', 'Verma', 'rahul.verma@example.com', '9876500003', 'Hyderabad'),
('Sara', 'Ali', 'sara.ali@example.com', '9876500004', 'Mangalore'),
('Arjun', 'Rao', 'arjun.rao@example.com', '9876500005', 'Chennai'),
('Meera', 'Nair', 'meera.nair@example.com', '9876500006', 'Kochi');

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, CURRENT_DATE - 20, 'Completed', 8397.00),
(2, CURRENT_DATE - 18, 'Completed', 64999.00),
(3, CURRENT_DATE - 15, 'Shipped', 25898.00),
(4, CURRENT_DATE - 12, 'Completed', 4499.00),
(5, CURRENT_DATE - 8, 'Processing', 93498.00),
(6, CURRENT_DATE - 5, 'Completed', 12898.00),
(1, CURRENT_DATE - 3, 'Pending', 24999.00),
(3, CURRENT_DATE - 1, 'Cancelled', 89999.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 2499.00),
(1, 9, 1, 899.00),
(1, 2, 1, 1899.00),
(2, 3, 1, 64999.00),
(3, 5, 1, 24999.00),
(3, 9, 1, 899.00),
(4, 8, 1, 4499.00),
(5, 4, 1, 89999.00),
(5, 10, 1, 3499.00),
(6, 6, 1, 12999.00),
(7, 5, 1, 24999.00),
(8, 4, 1, 89999.00);

INSERT INTO payments (order_id, amount, payment_method, payment_status, paid_at) VALUES
(1, 8397.00, 'UPI', 'Paid', CURRENT_TIMESTAMP - INTERVAL '20 days'),
(2, 64999.00, 'Card', 'Paid', CURRENT_TIMESTAMP - INTERVAL '18 days'),
(3, 25898.00, 'UPI', 'Paid', CURRENT_TIMESTAMP - INTERVAL '15 days'),
(4, 4499.00, 'Cash', 'Paid', CURRENT_TIMESTAMP - INTERVAL '12 days'),
(5, 93498.00, 'Card', 'Paid', CURRENT_TIMESTAMP - INTERVAL '8 days'),
(6, 12898.00, 'Net Banking', 'Paid', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(7, 24999.00, 'UPI', 'Pending', NULL),
(8, 89999.00, 'Card', 'Refunded', NULL);

SELECT 'Seed data inserted successfully' AS message;
