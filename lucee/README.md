Railo Vagrant Configuration
===========================

Here you will find a Vagrant configuration file and bootstrap
script which will configure the following stack for
VirtualBox.

* Ubuntu 14.04 64-bit
* 512MB RAM
* Port 8080 forwards to 8080 on the guest
* OpenJDK 7
* Tomcat 7
	* ROOT application points to /vagrant (your project)
* MySQL Server 5
	* User: *root*
	* Password: *password*
* Railo 4.2.1
	* WAR contents (WEB-INF, web.xml) are extracted to your /vagrant/www folder

