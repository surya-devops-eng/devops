#!/usr/bin/env bash
set -euo pipefail

# Create system certificate directory
sudo mkdir -p /etc/nginx/ssl

# Generate 2048-bit RSA key and self-signed X.509 certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx-selfsigned.key \
  -out /etc/nginx/ssl/nginx-selfsigned.crt \
  -subj "/C=IN/ST=Telangana/L=Hyderabad/O=DevOpsLab/OU=Platform/CN=localhost"

echo "SSL Certificate and Private Key successfully generated in /etc/nginx/ssl/"
