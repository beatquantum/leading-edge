#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Updating to OpenSSL version 1.1.1h                              *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Installing dependencies... (this will take a minute)            *"
apt-get update
apt-get install make -y 
apt-get install gcc -y 
cd /usr/src  
echo "* Downloading OpenSSL files...(this will take a minute)           *"
echo "* Source: https://www.openssl.org                                 *"
sudo wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz --no-check-certificate
sudo tar -zxf openssl-1.1.1g.tar.gz 
cd openssl-1.1.1g 
./config > /dev/null
echo "* Installing OpenSSL...(have patience!)                           *"
echo "* Running make...                                                 *"
make 
echo "* Running make test...                                            *"
make test 
echo "* Running make install...                                         *"
make install
echo "* Completing the links...                                         *"
echo "/usr/local/lib64" > /etc/ld.so.conf.d/openssl.conf
ldconfig > /dev/null
echo "* Reboot at your convenience and check the kernel using ssh -V    *"
echo "*******************************************************************"
fi
