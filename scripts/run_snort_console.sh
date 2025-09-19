#!/usr/bin/env bash
set -euo pipefail
IFACE="enp0s3"
sudo pkill -f snort || true
sudo mkdir -p /var/log/snort
sudo truncate -s 0 /var/log/snort/console.log
sudo chmod 644 /var/log/snort/console.log
sudo bash -c 'stdbuf -oL -eL snort -A console -q -c /etc/snort/snort.clean.conf -i '"$IFACE"' 2>&1 | tee -a /var/log/snort/console.log'
