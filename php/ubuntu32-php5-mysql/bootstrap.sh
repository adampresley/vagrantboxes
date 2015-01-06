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
apt-get --no-install-recommends install -y apache2 php5 libapache2-mod-php5 mysql-server mysql-client libmysqlclient-dev php5-mysql php5-curl

#
# Make Apache run as vagrant user
#
sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
sudo chown -R vagrant:www-data /var/lock/apache2

#
# Add rewrite mod
#
a2enmod rewrite

#
# Make our own default virtual host
#
a2dissite default
rm /etc/apache2/sites-available/default
echo '<VirtualHost *:80>
        ServerAdmin webmaster@localhost

        DocumentRoot /vagrant/www

        <Directory /var/www/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
</VirtualHost>
' > /etc/apache2/sites-available/default

a2ensite default

#
# Add Vagrant user to log 'adm' group so we can view logs
#
usermod -aG adm vagrant

#
# Restart Apache
#
service apache2 restart
