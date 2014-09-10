Go 64-bit Ubuntu
================

Here you will find a Vagrant configuration file and bootstrap
script which will configure the following stack for
VirtualBox.

* Ubuntu 14.04 64-bit
* 512MB RAM
* Go 1.3.1 Linux 64-bit

This box will create the recommended Google Go project structure in the **home** folder. Before starting up your Vagrant box you should alter two variables in the *bootstrap.sh* script.

```bash
ROOTPATH="github.com"
PROJECTNAME="project"
```

The **ROOTPATH** variable should be the path to your project after the **src** folder. As an example if your project is hosted on Github and your account name is *adampresley*, **ROOTPATH** would be *github.com/adampresley*. The finally the **PROJECTNAME** variable should be the name of your Go project.

When your Vagrant box is first fired up the following directories will be created in your home folder.

* /home/vagrant/go
* /home/vagrant/go/bin
* /home/vagrant/go/pkg
* /home/vagrant/go/src
* /home/vagrant/go/src/$ROOTPATH

And finally in the **ROOTPATH** a symbolic link will be made to point to you project folder at **/vagrant**.
