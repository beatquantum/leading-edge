#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Manual install of Debian Testing                                *"
sh bullseye.sh
echo "*******************************************************************"
echo "* Manual install of nginx with http/3 and other useful modules    *"
echo "* Enter 1 to continue or Ctrl-C to abort                          *"
read n
if [ $n -eq 1 ];
then
cd 
echo "deb https://nginx.org/packages/mainline/debian testing nginx" >> /etc/apt/sources.list.d/nginx-testing.list
~/
apt-get update && apt-get upgrade -y && apt-get install dpkg-dev uuid-dev -y
wget https://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key


fi
