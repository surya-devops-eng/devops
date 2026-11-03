# Production-Grade Nginx Reverse Proxy with TLS 1.3 & Rate Limiting

## Architecture Overview
This repository contains production configuration files for Nginx acting as an edge reverse proxy and SSL/TLS termination gate.

### Key Engineering Features
* **SSL/TLS Termination:** Configured with TLS 1.2/1.3 protocols, optimized cipher suites (`HIGH:!aNULL:!MD5`), and shared SSL session caching (`10m`).
* **Security Hardening Headers:** Enforces `Strict-Transport-Security` (HSTS), `X-Frame-Options` (Clickjacking prevention), and `X-Content-Type-Options` (MIME-sniffing prevention).
* **Traffic Control:** Employs Leaky Bucket Rate Limiting (`$binary_remote_addr`, `5r/s` baseline, `burst=10 nodelay`) to prevent Layer 7 DDoS and brute-force attacks.
* **HTTP to HTTPS Redirection:** Performs permanent `301` redirects on TCP Port 80 to enforce HTTPS transport.

## Verification & Deployment

```bash
# 1. Generate local certs
./scripts/generate_ssl.sh

# 2. Test Nginx Configuration Syntax
sudo nginx -t

# 3. Verify Security Headers via cURL
curl -kI https://localhost
eof
