# Incident 001 — Nginx Service Failure

## Incident Summary

The website became unavailable because the Nginx service was stopped.

## Environment

- OS: Ubuntu 26.04 LTS
- Web Server: Nginx 1.28.3
- Environment: VirtualBox Home Lab
- Service: nginx
- HTTP Port: 80

## Reported Symptom

The website was not responding as expected.

## Investigation

### 1. Checked Network Connectivity

```bash
ping -c 4 10.0.2.15

Result:

0% packet loss
Ubuntu VM was reachable

This confirmed that basic network connectivity was working.

Checked Nginx Service Status
systemctl status nginx --no-pager
Result :
Active: inactive (dead)
The Nginx service was not running.

 Checked Nginx Service Logs
journalctl -u nginx -n 50

The logs showed that the Nginx service had been stopped successfully.
Root Cause

The Nginx service was stopped in the lab environment.

Resolution

Started the Nginx service:

sudo systemctl start nginx

Then verified the service:

systemctl status nginx --no-pager

The service returned to:

Active: active (running)
Validation

Tested the HTTP endpoint:

curl -I http://localhost

Result:

HTTP/1.1 200 OK

The website was available again.

Troubleshooting Approach
Network Reachability
        ↓
Service Status
        ↓
Service Logs
        ↓
Root Cause
        ↓
Service Recovery
        ↓
HTTP Validation

Key Learning

A server can be reachable at the network level while the application service itself is unavailable.

Therefore, successful network connectivity does not prove that the application is available.

Support Classification
Incident Type: Application Availability
Affected Component: Nginx Web Server
Root Cause: Nginx service stopped
Resolution: Service started
Validation: HTTP 200 OK
Environment: Personal Home Lab

Disclaimer

This incident was reproduced in a controlled personal home lab for learning and portfolio purposes. It does not represent production experience.

