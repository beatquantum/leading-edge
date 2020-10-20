#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Installing apache2 and very useful modules                      *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
apt-get install apache2 apache2-utils libapache2-mod-fcgid 
a2enmod ssl
a2enmod rewrite
a2enmod http2
a2enmod headers
systemctl reload apache2
fi
echo "* apache2 has been installed. Enjoy!                              *"
