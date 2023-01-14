apt-get update
apt-get install -y libsasl2-dev python3-dev libldap2-dev libssl-dev python3-pip python-setuptools git systemctl curl
apt-get install -y mysql-server mysql-client
cd /opt
git clone https://github.com/linkedin/oncall.git
cd oncall
python3 setup.py develop
pip3 install -e '.[dev]'
