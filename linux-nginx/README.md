# Linux & Nginx Application Support Lab

Hands-on troubleshooting practice using Ubuntu Linux, Nginx, VirtualBox, systemd, HTTP, networking, and Linux logs.

## Environment

- Ubuntu 26.04 LTS
- VirtualBox
- Nginx 1.28.3
- VirtualBox NAT networking
- VM IP: 10.0.2.15
- HTTP port: 80

## Skills Practiced

- Linux service management
- Nginx troubleshooting
- HTTP troubleshooting
- Port and process verification
- Log analysis
- Configuration validation
- File and permission checks
- Network connectivity testing
- Evidence-based incident investigation

## Commands Practiced

```bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl reload nginx

journalctl -u nginx
ss -lntp
curl -I http://localhost
curl http://localhost

ip addr
ip route
ping
grep
tail
nginx -t
nginx -T
