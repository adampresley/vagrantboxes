Apache+PHP+MySQL Vagrant Configuration
======================================

Here you will find a Vagrant configuration file and bootstrap
script which will configure the following stack for
VirtualBox.

* Ubuntu 12.04 32-bit
* 1024MB RAM
* Port 8080 forwards to 80 on the guest
* Apache 2
	- This expects your project to have a folder named **www**. Apache will be pointed to that
* PHP 5 Apache module
* MySQL 5
	- User: root
	- Password: password
