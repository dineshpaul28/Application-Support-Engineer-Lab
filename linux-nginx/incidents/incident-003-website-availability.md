# Incident 003 — Website Availability Investigation

## Incident Summary

A website availability issue was reported. The issue was investigated across the web server, website files, network connectivity, and HTTP response layers.

## Environment

- OS: Ubuntu 26.04 LTS
- Web Server: Nginx 1.28.3
- Environment: VirtualBox Home Lab
- VM IP: 10.0.2.15
- HTTP Port: 80

## Reported Symptom

The website was reported as not loading correctly.

## Investigation

### 1. Checked HTTP Response

```bash
curl -I http://localhost

Result:

HTTP/1.1 200 OK

The local HTTP request was successful.

2. Checked Nginx Service
systemctl status nginx --no-pager

Nginx was active and running.

3. Checked Website Files
ls -lah /var/www/html

The website document root contained the Nginx HTML file.

4. Checked File Content
cat /var/www/html/index.nginx-debian.html

The HTML file contained valid website content.

5. Checked File Permissions

The website file was readable by the Nginx process.

6. Tested the VM Network Address
curl -I http://10.0.2.15

Result:

HTTP/1.1 200 OK

The website responded successfully through the VM's network address.

7. Tested from the Client

The website was accessed from the Windows host through the configured VirtualBox port forwarding.

The Nginx welcome page loaded successfully in the browser.

Investigation Result

The reported website availability issue could not be reproduced during the investigation.

The following checks were successful:

Nginx service       → Active
HTTP localhost      → 200 OK
Website file        → Present
File content        → Valid
File permissions    → Readable
VM HTTP address     → 200 OK
Browser access      → Successful
Root Cause

Root cause was not established because the reported issue could not be reproduced during the investigation.

No unsupported root cause was assigned.

Resolution / Next Action

Since the website was functioning normally during testing, no server-side change was required.

If the issue occurs again, additional evidence should be collected, including:

Exact timestamp
User/client affected
URL accessed
HTTP error message
Browser or client details
Relevant access logs
Relevant error logs

This information can be used to correlate the next occurrence with server-side activity.

Troubleshooting Approach
Reported Issue
      ↓
Check Service
      ↓
Check HTTP Response
      ↓
Check Website Files
      ↓
Check Permissions
      ↓
Test Network Address
      ↓
Test Client Access
      ↓
Compare Evidence
      ↓
Issue Not Reproduced
      ↓
Document Findings

Key Learning

A good Application Support investigation should be evidence-based.

If an issue cannot be reproduced and the available evidence shows that the application is functioning normally, the correct conclusion is "root cause not established" rather than guessing a cause.

Support Classification
Incident Type: Website Availability
Affected Component: Nginx / Website
Investigation Result: Issue Not Reproduced
Root Cause: Not Established
Environment: Personal Home Lab


Disclaimer: This incident was investigated in a controlled personal home lab for learning and portfolio purposes. It does not represent production experience.
