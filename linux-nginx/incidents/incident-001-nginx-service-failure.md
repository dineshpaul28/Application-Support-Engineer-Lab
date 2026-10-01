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
