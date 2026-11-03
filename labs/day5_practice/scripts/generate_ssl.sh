#!/usr/bin/env bash
set -euo pipefail

sudo mkdir -p /etc/nginx/ssl

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx-selfsigned.key \
  -out /etc/nginx/ssl/nginx-selfsigned.crt \
  -subj "/C=IN/ST=Telangana/L=Hyderabad/O=DevOpsLab/OU=Platform/CN=localhost"

echo "SSL Certificate successfully generated in /etc/nginx/ssl/"
