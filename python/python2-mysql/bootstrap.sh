#!/usr/bin/env bash

#
# Ensure MySQL server won't prompt for password. Just
# make it 'password'. Also, you can connect to MySQL
# by tunnelling through 127.0.0.1:2222 to 127.0.0.1:3306
#
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

#
# Install dependencies
#
apt-get update
apt-get -y install python-setuptools python-dev python-virtualenv python-mysqldb mysql-server mysql-client libmysqlclient-dev htop

#
# Install some Python libraries
#
pip install setuptools
pip install coverage
pip install nose
pip install MySQL-python
pip install python-dateutil
pip install pytz
pip install rednose
pip install requests
pip install sqlalchemy
