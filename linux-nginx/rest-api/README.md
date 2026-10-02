# REST API Troubleshooting Lab

Hands-on REST API troubleshooting practice for L1 Application Support using Python, HTTP, curl, and application logs.

## Environment

- Ubuntu 26.04 LTS
- Python 3
- REST API
- HTTP
- curl
- VirtualBox

## API Endpoint

The lab contains a simulated Orders API.

Example endpoint:

```text
GET /api/orders/5001

The API is hosted locally on:

127.0.0.1:8080

Skills Practiced
1. HTTP request/response troubleshooting
2. REST API fundamentals
3. HTTP status code analysis
4. curl-based API testing
5. Application process verification
6. Application log analysis
7. Request and timestamp correlation
8. Evidence-based troubleshooting
9. Escalation with technical evidence

HTTP Status Codes Practiced
1. 2xx — Successful
   200 OK — Request completed successfully.

2. 4xx — Client-side/request issues
   400 Bad Request — Invalid request.
   401 Unauthorized — Authentication required or failed.
   403 Forbidden — Request is authenticated but not permitted.
   404 Not Found — Resource or endpoint not found.

3. 5xx — Server-side/application issues
   500 Internal Server Error — Application/server encountered an internal error.
   502 Bad Gateway — Gateway/proxy received an invalid response from an upstream service.
   503 Service Unavailable — Service is unavailable or unable to handle the request.
   504 Gateway Timeout — Gateway/proxy did not receive a timely response from an upstream service.


Troubleshooting Commands

curl -i http://127.0.0.1:8080/api/orders/5001

curl -v http://127.0.0.1:8080/api/orders/5001

ss -lntp | grep ':8080'

ps aux | grep '[p]ython3 app.py'

User/API Report
      ↓
Confirm Scope
      ↓
Reproduce the Error
      ↓
Check HTTP Status Code
      ↓
Check Application Process
      ↓
Check Port
      ↓
Check Application Logs
      ↓
Check Dependencies
      ↓
Check Recent Changes
      ↓
Identify Root Cause
      ↓
Resolve or Escalate
      ↓
Validate Recovery
      ↓
Document Incident

Key Learning

An HTTP error code identifies the behavior observed by the client, but it does not automatically identify the root cause.

For example, an HTTP 500 response confirms that the server encountered an internal error, but further investigation is required to determine why.

Disclaimer

This is a simulated personal home-lab project created for Application Support learning and portfolio purposes. It is not production experience.
