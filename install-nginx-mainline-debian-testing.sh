#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* USE ONLY FOR DEBIAN TESTING VERSION as root/sudoer              *"
echo "* Select Installation Source                                      *"
echo "* 1 (nginx.org buster mainline - this is required for testing)    *"
echo "* 2 (nginx.io a third party that provides the latest nginx)       *"
echo "* 3 to skip, or Ctrl-C to abort                                   *"
read n
if [ $n -eq 1 ];
then
echo "* Installing useful packages first                                *"
sudo apt-get update
sudo apt-get install curl gnupg2 ca-certificates lsb-release
curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
echo "*******************************************************************"
echo "* IMPORTANT - VERIFY THAT YOU SAW 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 ABOVE. OTHERWISE Ctrl-C to abort *"
sudo mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
touch /etc/apt/sources.list.d/nginx.list
truncate -s 0 /etc/apt/sources.list.d/nginx.list
echo "deb http://nginx.org/packages/mainline/debian buster nginx" >> /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/mainline/debian buster nginx" >> /etc/apt/sources.list.d/nginx.list
apt-get update
apt install nginx -y
echo "Thank you. Nginx has been installed. Check version below.        *"
nginx -v
echo "Goodbye"
fi
if [ $n -eq 2 ];
then
apt install apt-transport-https lsb-release ca-certificates curl gnupg -y
curl https://mirror-cdn.xtom.com/sb/nginx/public.key | apt-key add -
echo "deb https://mirror-cdn.xtom.com/sb/nginx/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sb-nginx.list
apt update
apt install nginx-extras -y
echo "Thank you. Nginx has been installed. Check version below.        *"
nginx -v
echo "Goodbye"
fi
