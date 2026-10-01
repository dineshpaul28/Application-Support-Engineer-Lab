# Incident 005 — Missing Payment Record

## Incident Summary

**Issue:** An order exists in the database, but no corresponding payment record was found.

**Order ID:** 5007

**Severity:** Medium

**Environment:** MySQL Application Support Lab

---

## Business Impact

The order exists and is in Pending status, but there is no payment record associated with it.

This makes it necessary to determine whether the payment was never attempted, failed before reaching the payment system, or the payment record was not created successfully.

---

## Investigation

### Step 1 — Check the Order

```sql
SELECT *
FROM orders
WHERE order_id = 5007;

Result:

Order ID: 5007
Customer ID: 102
Amount: 2199.00
Status: Pending
Step 2 — Check for a Payment Record
SELECT *
FROM payments
WHERE order_id = 5007;

Result:

No payment record was found.

Step 3 — Find Orders Without Payment Records

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

Result:

Order 5007 was identified without a corresponding payment record.

Findings

The database confirms:

1. Order 5007 exists.
2. Order status is Pending.
3. Order amount is 2199.00.
4. No payment record exists for this order.

The database alone cannot establish why the payment record is missing.

Root Cause

Root cause was not established from the database evidence alone.

Possible areas requiring further investigation include the payment gateway, payment service, application logs, API communication, or transaction processing.

These are investigation areas, not confirmed root causes.

Recommended Next Investigation

Check:

1. Application logs for order 5007.
2. Payment-service logs.
3. Payment gateway response, if applicable.
4. Relevant transaction timestamp.
5. API request and response details.
6. Transaction/request ID or correlation ID.
7. Any failed or timed-out payment operation.

Resolution

No payment record was manually created.

The issue should be escalated with the order ID, customer ID, amount, timestamp, and database evidence so the relevant Application Support or payment team can investigate further.

L1 Support Learning

This incident demonstrates how SQL can help an Application Support Engineer identify missing related records.

A LEFT JOIN can be used to find records that exist in one table but have no matching record in another table.

Important principle:

Do not create or modify transaction records manually just to make the data appear correct.

First establish what happened and follow the organization's approved recovery procedure.

Evidence-Based Troubleshooting Flow

Customer Report
↓
Check Order
↓
Check Payment Record
↓
Identify Missing Relationship
↓
Check Application/Payment Logs
↓
Determine Root Cause
↓
Resolve or Escalate
↓
Validate Recovery

Disclaimer

This is a simulated personal home-lab incident created for Application Support learning and portfolio purposes. It is not production experience.
