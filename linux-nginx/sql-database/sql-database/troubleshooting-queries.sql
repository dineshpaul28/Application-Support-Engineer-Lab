-- Application Support Engineer Lab
-- SQL Troubleshooting Queries
-- Database: support_lab

USE support_lab;

-- 1. Check a specific order
SELECT *
FROM orders
WHERE order_id = 5004;


-- 2. Check payment details for an order
SELECT *
FROM payments
WHERE order_id = 5004;


-- 3. Find orders that are Pending
SELECT *
FROM orders
WHERE status = 'Pending';


-- 4. Find orders with completed payment but Pending order status
SELECT
    o.order_id,
    o.customer_id,
    o.amount AS order_amount,
    o.status AS order_status,
    p.amount AS payment_amount,
    p.status AS payment_status
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.status = 'Completed'
  AND o.status = 'Pending';


-- 5. Find orders with no payment record
SELECT
    o.order_id,
    o.customer_id,
    o.amount,
    o.status,
    p.payment_id,
    p.status AS payment_status
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
WHERE p.order_id IS NULL;


-- 6. Compare order and payment amounts
SELECT
    o.order_id,
    o.amount AS order_amount,
    p.amount AS payment_amount,
    o.status AS order_status,
    p.status AS payment_status
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.amount <> p.amount;


-- 7. Count orders by status
SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status;


-- 8. Calculate total value of Pending orders
SELECT
    COUNT(*) AS pending_orders,
    SUM(amount) AS pending_value
FROM orders
WHERE status = 'Pending';


-- 9. Find customers with multiple orders
SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- 10. Find orders above the average order amount
SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);


-- 11. Find customers who have Pending orders
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE status = 'Pending'
);


-- 12. Find the latest order for each customer
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        status,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS rn
    FROM orders
) x
WHERE rn = 1;
