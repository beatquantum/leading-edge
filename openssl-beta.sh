#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Here is your existing OpenSSL version                           *"
openssl version
echo "*******************************************************************"
echo "* Updating to OpenSSL version 3.1 beta for Debian 11 / Ubuntu 22     *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1 - Running apt update *"
apt-get update > /dev/null
echo "* Step 2 - Installing make and gcc *"
apt-get install make gcc -y > /dev/null
cd /usr/local/src  
echo "* Step 3 - Downloading OpenSSL files *"
echo "* Source: https://www.openssl.org                                 *"
sudo wget https://www.openssl.org/source/openssl-3.1.0-beta1.tar.gz --no-check-certificate > /dev/null
sudo tar -zxf openssl-3.1.0-beta1.tar.gz > /dev/null
cd openssl-3.1.0-beta1/ > /dev/null
echo "* Step 4 - Running config *"
./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl > /dev/null
echo "* Step 5 - Installing OpenSSL *"
echo "* Running make...(Have patience this takes time...about 3 minutes) *"
make > /dev/null
echo "* Running make test...*"
make test > /dev/null
echo "* Running make install...*"
make install > /dev/null
echo "* Step 6 - Completing the links...*"
truncate -s 0/etc/ld.so.conf.d/openssl.conf
echo "/usr/local/ssl/lib64" > /etc/ld.so.conf.d/openssl.conf
ldconfig -v > /dev/null
mv /usr/bin/c_rehash /usr/bin/c_rehash.BEKUP
mv /usr/bin/openssl /usr/bin/openssl.BEKUP
echo "Append the path to include ":/usr/local/ssl/bin"
read x
nano /etc/environment
openssl version
echo "* Reboot at your convenience and check with openssl version       *"
echo "*******************************************************************"
fi
