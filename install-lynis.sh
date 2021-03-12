#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Ensuring that sudo and git are installed                        *"
apt-get update > /dev/null
apt-get install sudo git -y
echo "* Installing lynis in users /home folder                          *"
cd /home
git clone https://github.com/CISOfy/lynis
echo "* Please run (sh run-lynis.sh) whenever you want                  *"
echo *" Goodbye.                                                        *"
