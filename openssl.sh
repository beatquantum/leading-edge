#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Here is your existing OpenSSL version                             *"
openssl version
echo "*******************************************************************"
echo "* Updating to OpenSSL version 1.1.1m                              *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1 - Running apt update *"
apt-get update > /dev/null
echo "* Step 2 - Installing make and gcc *"
apt-get install make gcc -y > /dev/null
cd /usr/src  
echo "* Step 3 - Downloading OpenSSL files *"
echo "* Source: https://www.openssl.org                                 *"
sudo wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz --no-check-certificate > /dev/null
sudo tar -zxf openssl-1.1.1m.tar.gz > /dev/null
cd openssl-1.1.1m > /dev/null
echo "* Step 4 - Running config *"
./config > /dev/null
echo "* Step 5 - Installing OpenSSL *"
echo "* Running make...(Have patience this takes time...about 3 minutes) *"
make > /dev/null
echo "* Running make test...*"
make test > /dev/null
echo "* Running make install...*"
make install > /dev/null
echo "* Step 6 - Completing the links...*"
echo "/usr/local/lib64" > /etc/ld.so.conf.d/openssl.conf
ldconfig > /dev/null
echo "* Reboot at your convenience and check with openssl version       *"
echo "*******************************************************************"
fi
