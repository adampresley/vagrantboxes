Python 2 Vagrant Configuration
==============================

Here you will find a Vagrant configuration file and bootstrap
script which will configure the following stack for
VirtualBox.

* Ubuntu 14.04 64-bit
* 512MB RAM
* Port 8080 forwards to 8080 on the guest
* Python 2.7
* MySQL Server 5
	* User: *root*
	* Password: *password*
* The following Python modules:
	* setuptools
	* coverage
	* nose
	* MySQL-python
	* python-dateutil
	* pytz
	* rednose
	* requests
	* sqlalchemy
