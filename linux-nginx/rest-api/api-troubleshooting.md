# API Troubleshooting Notes

I created a small Python API in my Ubuntu VM to practice troubleshooting HTTP issues.

The API was running on port 8080.

## Checking if the application is running

I used:

```bash
ps aux | grep '[p]ython3 app.py'

This helped me confirm whether the Python application process was running.

Checking the port

I used:

ss -lntp | grep ':8080'

This checks whether something is listening on port 8080.

One important thing I learned here is that a listening port does not automatically mean the application is working correctly. I still need to test the actual endpoint.

Testing the API

I used curl to send a request:

curl -i http://127.0.0.1:8080/api/orders/5001

For more detailed information:

curl -v http://127.0.0.1:8080/api/orders/5001

The response helped me understand what the client was actually receiving from the API.

Understanding the HTTP response

Some of the main status codes I need to recognize as an Application Support Engineer are:

200 — Request successful
400 — Bad request
401 — Authentication issue
403 — Permission/access issue
404 — Resource or endpoint not found
500 — Internal server error
502 — Bad response from an upstream service
503 — Service unavailable
504 — Upstream timeout
When I get a 500 error

A 500 response doesn't tell me the root cause by itself.

My first checks would be:

ps aux | grep '[p]ython3 app.py'

ss -lntp | grep ':8080'

curl -i http://127.0.0.1:8080/api/orders/5001

Then I would check the application output/logs and look at the exact request and time when the error occurred.

If the application depends on another service, I would check that dependency as well.

What I learned

The main thing I learned from this lab is that troubleshooting an API is not just about looking at the HTTP status code.

I need to work backwards from the error:

API request
   ↓
HTTP response
   ↓
Application process
   ↓
Application logs
   ↓
Dependencies
   ↓
Configuration / recent changes

I should only call something the root cause when I have enough evidence to support it.

Lab Note

This is a local practice environment. The API and errors are simulated for learning purposes and are not production experience.
 
