#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* The script will install the dependencies needed to run the CISA *"
echo "* scanner such as python3, pycryptodome and termcolor.            *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "Updating sources"
apt update
echo "Upgrading packages"
apt upgrade -y
echo "Installing python3 (if not already installed)"
apt install python3
echo "Installing pip (if not already installed)."
apt install pip
echo "Removing PyCrypto that is obsolete and will fail"
pip3 uninstall PyCrypto
echo "Installing the correct PyCrypto"
pip3 install -U PyCryptodome
echo "Installing other requirements"
pip install termcolor
cd /home
echo "Downloading CISA scanner"
git clone https://github.com/cisagov/log4j-scanner
cd /home/log4j-scanner/log4j-scanner
echo "Edit the line below to select your own url"
python3 log4j-scan.py -u https://santoshpandit.com
fi
