-- =========================================
-- E-Commerce Order Management: Sample Data
-- =========================================

USE ecommerce_db;

INSERT INTO customers (name, email, city, signup_date) VALUES
('Ravi Kumar', 'ravi@mail.com', 'Hyderabad', '2024-01-10'),
('Ananya Singh', 'ananya@mail.com', 'Mumbai', '2024-02-15'),
('Karthik Reddy', 'karthik@mail.com', 'Hyderabad', '2024-03-05'),
('Priya Sharma', 'priya@mail.com', 'Delhi', '2024-04-20');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 499.00, 50),
('Bluetooth Speaker', 'Electronics', 1499.00, 30),
('Notebook Set', 'Stationery', 199.00, 100),
('Office Chair', 'Furniture', 4999.00, 15);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-05-01', 'Delivered'),
(2, '2024-05-03', 'Delivered'),
(1, '2024-05-10', 'Pending'),
(3, '2024-05-12', 'Delivered');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 499.00),
(1, 3, 1, 199.00),
(2, 2, 1, 1499.00),
(3, 4, 1, 4999.00),
(4, 1, 1, 499.00);
