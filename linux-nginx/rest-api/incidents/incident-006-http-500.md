# Incident 006 — HTTP 500 From Orders API

## What happened

I created a small Python API in my Ubuntu VM to practice investigating an application error.

When I tested the Orders API endpoint, it returned:

```text
HTTP/1.0 500 Internal Server Error

Endpoint:

GET /api/orders/5001

The API was running on port 8080.

Initial Test

I used curl: curl -i http://127.0.0.1:8080/api/orders/5001

The API returned a 500 response.

I then checked whether the Python application was still running.

ps aux | grep '[p]ython3 app.py'

The process was running, so the application had not simply stopped.

Port Check

I checked port 8080:

ss -lntp | grep ':8080'

The application was listening on the expected port.

This ruled out a basic "application is not listening" problem.

Checking the Application Output

The terminal running the Python application showed the request:

127.0.0.1 - - "GET /api/orders/5001 HTTP/1.1" 500 -

This confirmed that the request was reaching the application and the application was returning HTTP 500.

Checking the API Response

I also tested the response body:

curl -s http://127.0.0.1:8080/api/orders/5001

The response was:

{"error":"Internal Server Error"}

Finding the Cause

I checked the Python application code:

cat ~/application-support-lab/app.py

The endpoint contained:

self.send_response(500)

The 500 response was intentionally configured in the lab.

So the actual cause in this simulation was confirmed by checking the application code.

Root Cause

The API endpoint was configured to deliberately return HTTP 500.

This was a simulated application failure created for troubleshooting practice.

Resolution

For the purpose of the lab, I identified the configuration in the application code that was generating the 500 response.

The important part of the exercise was not just seeing the error, but tracing it through:

API Request
    ↓
HTTP 500
    ↓
Application Process
    ↓
Port 8080
    ↓
Application Output
    ↓
Application Code

What I Learned

A running application and an open port do not necessarily mean the application is working correctly.

In this case:

The Python process was running.
Port 8080 was listening.
The request reached the application.
The application returned HTTP 500.
Checking the application code confirmed why.

This helped me understand the difference between checking whether a service is running and checking whether the application is actually processing requests correctly.

L1 Support Perspective

If this were a real production issue, I would collect the endpoint, timestamp, HTTP status, request/transaction ID if available, application logs, and other relevant evidence before escalating.

I would not assume that HTTP 500 itself is the root cause.

Lab Note

This was a simulated local incident created in my Ubuntu home lab for Application Support practice. It is not production experience.
