apt-get update
apt-get install wget systemctl
wget "https://github.com/prometheus/alertmanager/releases/download/v0.24.0/alertmanager-0.24.0.linux-amd64.tar.gz"
tar xvf alertmanager-0.24.0.linux-amd64.tar.gz -C /tmp
cp /tmp/alertmanager-0.24.0.linux-amd64/alertmanager /usr/local/bin/
cp /tmp/alertmanager-0.24.0.linux-amd64/amtool /usr/local/bin/
mkdir -p /etc/alertmanager
mkdir /var/lib/alertmanager
cat << EOF > /etc/alertmanager/alertmanager.yml
global:
  resolve_timeout: 3m
receivers:
  - name: test_alert
    webhook_configs:
      - send_resolved: true
        url: http://127.0.0.1:8080/mattermost/inapp-test-alerts
route:
  receiver: test_alert
  repeat_interval: 1m
  routes:
    - group_by:
      - alertname
      matchers:
      - alertname="TestAlarm"
      receiver: test_alert
inhibit_rules:
  - source_match:
      severity: 'critical'
    target_match:
      severity: 'warning'
    equal: ['alertname', 'dev', 'instance']
EOF
useradd --no-create-home --shell /bin/false alertmanager
chown alertmanager:alertmanager -R /etc/alertmanager
chown alertmanager:alertmanager -R /var/lib/alertmanager/
cat << EOF > /lib/systemd/system/alertmanager.service
[Unit]
Description=Alertmanager service
[Service]
User=alertmanager
Group=alertmanager
ExecStart=/usr/local/bin/alertmanager --config.file /etc/alertmanager/alertmanager.yml --storage.path=/var/lib/alertmanager/ --web.listen-address=0.0.0.0:9200 --data.retention=480h
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable alertmanager.service
systemctl start alertmanager.service
cat << EOF >> /etc/prometheus/prometheus.yml
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9200
rule_files:
  - /etc/prometheus/dynamic-rules.yml
EOF
systemctl restart prometheus.service
