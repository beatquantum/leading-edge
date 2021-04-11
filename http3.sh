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
cd /home
apt-get update && apt-get upgrade -y && apt-get install sudo wget curl haveged hexedit rsync apt-transport-https lsb-release ca-certificates dpkg-dev uuid-dev mercurial -y
wget https://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
rm nginx_signing.key
wget -O /etc/apt/trusted.gpg.d/nginx-mainline.gpg https://packages.sury.org/nginx-mainline/apt.gpg
echo "deb https://packages.sury.org/nginx-mainline/ bullseye main" > /etc/apt/sources.list.d/nginx-sury.list
echo "deb-src https://packages.sury.org/nginx-mainline/ bullseye main" >> /etc/apt/sources.list.d/nginx-sury.list
apt-get update && apt-get upgrade -y
echo "*******************************************************************"
apt list nginx
echo "* Verify that the nginx version above is 1.19.8. Otherwise abort! *"
read v
if [ $v -eq 1 ];
then
sudo apt-get build-dep nginx
sudo apt-get source nginx
hg clone -b quic https://hg.nginx.org/nginx-quic
rsync -rl nginx-quic/ nginx-1.19.8
fi
fi
