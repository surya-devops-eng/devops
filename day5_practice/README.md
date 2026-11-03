# Day 5 Practice: Nginx Architecture, Traffic Engineering & Security Hardening

## Architecture Overview
Production-grade Nginx configuration demonstrating reverse proxying, TLS 1.3 termination, rate limiting, and security header hardening.

### Key Engineering Concepts
* **Event Loop & Master/Worker Architecture:** Non-blocking asynchronous socket handling.
* **SSL/TLS Termination:** Configured with modern ciphers and shared SSL session cache.
* **Rate Limiting:** Leaky-bucket implementation using `limit_req_zone` (5 r/s baseline, burst 10).
* **Security Headers:** HSTS enforcement, MIME-type protection, and Clickjacking mitigation.
