#!/usr/bin/env bash

#
# This script sets up MySQL with a root password of
# 'password'. It also sets it up for outside access
# so you can connect from your local machine via 3306.
# Finally it creates a database and grants root all
# access from all hosts. Be sure to change the database
# to whatever you need.
#

#
# Ensure MySQL server won't prompt for password. Just
# make it 'password'.
#
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

#
# Setup dependencies
#
apt-get update
apt-get -y install mysql-server mysql-client

rm -f /etc/mysql/my.cnf
cp /vagrant/config/my.cnf /etc/mysql

mysql -uroot -ppassword -e "CREATE DATABASE newdatabase"
mysql -uroot -ppassword mysql -e "GRANT ALL ON *.* TO 'root'@'%'"
mysql -uroot -ppassword mysql -e "FLUSH PRIVILEGES"

service mysql restart