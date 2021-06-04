#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
apt-get update
apt-get install sudo wget git haveged hexedit curl software-properties-common make ufw build-essential tree nmap net-tools -y
echo "* All done                                                        *"
