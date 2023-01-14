#!/bin/bash

TEXTFILE_PATH=/opt/prometheus_exporters/textfile
NUM_FAILED_ATTEMPTS=$(grep -c "Failed password" /var/log/auth.log)
cat << EOF > "$TEXTFILE_PATH/num_failed_login_attempts.prom"
num_failed_login_attempts $NUM_FAILED_ATTEMPTS
EOF
