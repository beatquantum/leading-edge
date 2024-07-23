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
echo "* Updating to OpenSSL version 3.3.1 for Debian 11 / Ubuntu 22     *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read -r n
if [ "$n" -eq 1 ]; then
    echo "* Step 1 - Running apt update *"
    apt-get update > /dev/null

    echo "* Step 2 - Installing make and gcc *"
    apt-get install -y make gcc

    echo "* Step 3 - Downloading OpenSSL files *"
    echo "* Source: https://www.openssl.org                                 *"
    version="3.3.1"
    openssl_file="openssl-$version.tar.gz"
    wget -q --no-check-certificate "https://www.openssl.org/source/$openssl_file" -P /usr/src/
    tar -zxf "/usr/src/$openssl_file" -C /usr/src/

    echo "* Step 4 - Building and installing OpenSSL *"
    openssl_dir="/usr/src/openssl-$version"
    cd "$openssl_dir"
    ./config
    make
    make test
    make install

    echo "* Step 5 - Updating library links *"
    echo "/usr/local/lib64" | tee /etc/ld.so.conf.d/openssl.conf > /dev/null
    ldconfig

    echo "* Upgrade completed. Reboot at your convenience and check with 'openssl version'. *"
    echo "*******************************************************************"
fi
