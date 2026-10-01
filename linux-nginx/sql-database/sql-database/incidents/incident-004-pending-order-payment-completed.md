# Incident 004 — Order Pending After Successful Payment

## Incident Summary

**Issue:** Customer reported that an order was still showing as Pending even though the payment had been completed.

**Order ID:** 5004

**Severity:** Medium

**Environment:** MySQL Application Support Lab

---

## Business Impact

The payment was recorded as Completed, but the corresponding order remained in Pending status.

This creates a transaction-state inconsistency and may affect order processing or customer-facing order status.

---

## Investigation

### Step 1 — Check Order Status

```sql
SELECT *
FROM orders
WHERE or
der_id = 5004;

Result:

Order ID: 5004
Customer ID: 101
Amount: 799.00
Status: Pending

Step 2 — Check Payment Status

SELECT *
FROM payments
WHERE order_id = 5004;

Result:

Payment ID: 9004
Order ID: 5004
Amount: 799.00
Payment Status: Completed
Step 3 — Identify Order/Payment Status Mismatch

SELECT
    o.order_id,
    o.status AS order_status,
    p.status AS payment_status
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.status = 'Completed'
  AND o.status = 'Pending';

Result:

Order 5004 was identified as having:

Order status: Pending
Payment status: Completed
Step 4 — Compare Transaction Amounts

SELECT
    o.order_id,
    o.amount AS order_amount,
    p.amount AS payment_amount,
    o.status AS order_status,
    p.status AS payment_status
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.order_id = 5004;

Result:

Order amount: 799.00
Payment amount: 799.00
Amounts matched.
Findings

The database confirms a transaction-state mismatch:

Payment: Completed
Order: Pending
Amount: Matched

The database investigation did not establish why the order status was not updated after successful payment.

Further investigation would require application or integration logs.

Root Cause

Root cause was not established from the database evidence alone.

The available evidence confirms the inconsistent transaction state but does not prove whether the issue occurred in the application, payment integration, event processing, or another component.

Recommended Next Investigation

Check:

1. Application logs for order 5004.
2. Payment-service or integration logs.
3. Relevant timestamps.
4. Transaction/request IDs if available.
5. Any failed API or event-processing operation.
6. Recent application or configuration changes.

Resolution

No direct database modification was performed.

The issue should be escalated to the appropriate Application Support / Development team with the database evidence and transaction details.

L1 Support Learning

This incident demonstrates that Application Support engineers should:

1. Verify the reported transaction directly in the database.
2. Compare related records across tables.
3. Check whether amounts and statuses match.
4. Avoid assuming the root cause.
5. Collect evidence before escalation.
6. Never manually modify production transaction data without authorization and procedure.

Evidence-Based Troubleshooting Flow

Customer Report
↓
Check Order
↓
Check Payment
↓
Compare Status
↓
Compare Amount
↓
Check Application/Integration Logs
↓
Identify Root Cause or Escalate With Evidence

Disclaimer

This is a simulated personal home-lab incident created for Application Support learning and portfolio purposes. It is not production experience.

