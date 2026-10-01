# SQL & MySQL Application Support Lab

Hands-on MySQL database troubleshooting lab focused on investigating application transactions and customer/order/payment issues.

## Environment

- MySQL 8.4
- Ubuntu Linux 26.04 LTS
- VirtualBox
- SQL

## Database

The lab database is:

```text
support_lab

Tables:
customers
orders
payments

Relationship:

customers
    |
    | customer_id
    v
orders
    |
    | order_id
    v
payments

SQL Skills Practiced
SELECT
WHERE
JOIN
INNER JOIN
LEFT JOIN
GROUP BY
HAVING
COUNT
SUM
AVG
MIN
MAX
Subqueries
CTEs
Window functions


Database Troubleshooting Skills
Database service verification
MySQL port verification
Database connectivity testing
Transaction investigation
Missing-record investigation
Order/payment reconciliation
Data inconsistency investigation
