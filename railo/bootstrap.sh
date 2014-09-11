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
apt-get --no-install-recommends install -y default-jdk tomcat7 unzip mysql-server mysql-client

#
# Remove the current Tomcat ROOT app and link to
# the vagrant share.
#
rm -Rf /var/lib/tomcat7/webapps/ROOT
ln -sf /vagrant/www /var/lib/tomcat7/webapps/ROOT

#
# Download the latest Railo WAR and extract
# to /vagrant/www.
#
wget http://www.getrailo.org/down.cfm?item=/railo/remote/download42/4.2.1.000/custom/all/railo-4.2.1.000.war -O /home/vagrant/railo.zip
unzip /home/vagrant/railo.zip -d /vagrant/www

#
# Restart Tomcat
#
service tomcat7 restart