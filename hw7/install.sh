apt-get update
apt-get install -y adduser libfontconfig1 wget systemctl
wget https://dl.grafana.com/oss/release/grafana_9.3.2_amd64.deb
dpkg -i grafana_9.3.2_amd64.deb
mkdir /run/grafana
chown -R grafana /run/grafana
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
