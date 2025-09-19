#!/usr/bin/env bash
set -euo pipefail
sudo chmod 755 /var/log/snort
sudo chmod 644 /var/log/snort/console.log /var/log/snort/alert.fast || true
sudo /opt/splunk/bin/splunk login
sudo /opt/splunk/bin/splunk add monitor /var/log/snort/console.log -index main -sourcetype snort_console || true
sudo /opt/splunk/bin/splunk add monitor /var/log/snort/alert.fast   -index main -sourcetype snort_alert.fast || true
sudo /opt/splunk/bin/splunk list monitor | grep /var/log/snort
