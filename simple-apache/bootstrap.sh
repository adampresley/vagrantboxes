#!/usr/bin/env bash

#
# Install dependencies
#
apt-get --no-install-recommends install -y apache2

#
# Point Apache home to our folder
#
rm -Rf /var/www
mkdir /var/www
ln -sf /vagrant/www /var/www/html

#
# Restart Apache
#
service apache2 restart