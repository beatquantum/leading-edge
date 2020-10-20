#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Adding PPAs for apache2, nginx and php                          *"
echo "* Source: Ondrej Sury                                             *"
echo "* ONLY FOR UBUNTU 20.04- Enter 1 to continue, or Ctrl-C to abort  *"
read n
if [ $n -eq 1 ];
then
echo "* Temporarily IPv6 has been disabled for adding PPAs. Reboot later*"
sudo sysctl net.ipv6.conf.all.disable_ipv6=1
echo "* Please follow instructions on the screen                        *"
sudo add-apt-repository ppa:ondrej/apache2 
sudo add-apt-repository ppa:ondrej/nginx
sudo add-apt-repository ppa:ondrej/php
echo "* Adding repository for MariaDB 10.5                              *"
echo "* Source: Mariadb.org                                             *"
sudo apt-get install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://mirrors.ukfast.co.uk/sites/mariadb/repo/10.5/ubuntu focal main'
fi
echo "* Updating available packages and cleaning                        *"
apt-get update
apt-get upgrade -y 
apt-get autoremove --purge -y 
apt-get clean 
echo "* Enjoy the new apache2, nginx, php and mariaDB                   *"
echo "*******************************************************************"
