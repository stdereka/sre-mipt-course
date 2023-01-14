service mysql start
mysql -u root < ./db/schema.v0.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234'; FLUSH PRIVILEGES;" | mysql -u root
cat << EOF > /lib/systemd/system/oncall.service
[Unit]
Description=Oncall service
[Service]
ExecStart=/usr/local/bin/oncall-dev /opt/oncall/configs/config.yaml
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable oncall.service
systemctl start oncall.service
