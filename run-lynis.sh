#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Pulling the latest lynis from GitHub                            *"
cd /home/lynis
git pull
echo "* Running lynis now. Log file is in /var/log/lynis.log            *"
./lynis audit system --usecwd --verbose
echo "*-----------------------------------------------------------------*"
