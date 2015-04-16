#!/usr/bin/env bash

#
# Install dependencies
#
apt-get update
apt-get --no-install-recommends install -y default-jdk tomcat7 unzip

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
wget http://bitbucket.org/lucee/lucee/downloads/lucee-4.5.1.000.war -O /home/vagrant/lucee.zip
unzip /home/vagrant/lucee.zip -d /vagrant/www

#
# Restart Tomcat
#
service tomcat7 restart