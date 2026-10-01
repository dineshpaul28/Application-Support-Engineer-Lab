-- Application Support Engineer Lab
-- MySQL Database Setup
-- Database: support_lab

CREATE DATABASE support_lab;

USE support_lab;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    status VARCHAR(20)
);

-- Customer test data
INSERT INTO customers (customer_id, customer_name, email, status)
VALUES
(101, 'Rahul Sharma', 'rahul@example.com', 'Active'),
(102, 'Priya Singh', 'priya@example.com', 'Active'),
(103, 'Amit Kumar', 'amit@example.com', 'Inactive'),
(104, 'Neha Verma', 'neha@example.com', 'Active'),
(105, 'Rohit Mehta', 'rohit@example.com', 'Active');

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(30)
);

-- Order test data
INSERT INTO orders (order_id, customer_id, order_date, amount, status)
VALUES
(5001, 101, '2026-09-18', 2499.00, 'Completed'),
(5002, 102, '2026-09-18', 1599.00, 'Processing'),
(5003, 103, '2026-09-19', 4999.00, 'Cancelled'),
(5004, 101, '2026-09-20', 799.00, 'Pending'),
(5005, 104, '2026-09-20', 3299.00, 'Completed'),
(5006, 105, '2026-09-21', 1299.00, 'Processing'),
(5007, 102, '2026-09-23', 2199.00, 'Pending');

-- Payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(30)
);

-- Payment test data
INSERT INTO payments (payment_id, order_id, payment_date, amount, status)
VALUES
(9001, 5001, '2026-09-18', 2499.00, 'Completed'),
(9002, 5002, '2026-09-18', 1599.00, 'Completed'),
(9003, 5003, '2026-09-19', 4999.00, 'Failed'),
(9004, 5004, '2026-09-20', 799.00, 'Completed'),
(9005, 5005, '2026-09-20', 3299.00, 'Completed'),
(9006, 5006, '2026-09-21', 1299.00, 'Pending');

-- Note:
-- Order 5007 intentionally has no payment record.
-- This is used for a missing-payment investigation.
