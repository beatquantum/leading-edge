#!/bin/bash

clear

echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"

# Update package lists
apt-get update

# Install essential packages
apt-get install -y sudo wget git haveged hexedit curl software-properties-common make ufw build-essential tree nmap net-tools qrencode usbguard

echo "* All done                                                        *"
