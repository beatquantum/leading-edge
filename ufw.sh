#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* This script installs UFW with or without email environment      *"
echo "* Enter 1 to without-email, 2 with-email, or Ctrl-C to abort      *"
read n
if [ $n -eq 1 ];
then
echo "* Installing UFW for 22, 4422, 80, 443                            *"
apt-get update > /dev/null
apt-get install ufw -y > /dev/null
ufw default deny incoming > /dev/null
ufw allow 22 > /dev/null
ufw allow 80 > /dev/null
ufw allow 443 > /dev/null
ufw allow 4422 > /dev/null
fi
if [ $n -eq 2 ];
then
echo "* Installing UFW for 22, 4422, 80, 443, 25, 110, 143, 465, 587, 993 and 995 *"
apt-get update > /dev/null
apt-get install ufw -y > /dev/null
ufw default deny incoming
ufw allow in 22
ufw allow in 25
ufw allow in 80
ufw allow in 110
ufw allow in 143
ufw allow in 443
ufw allow in 465
ufw allow in 587
ufw allow in 993
ufw allow in 995
ufw allow in 4422
fi
ufw enable
echo "*******************************************************************"
echo "* VERY IMPORANT                                                    *"
echo "* I assumed your SSH runs on port 22 or 4422.                     *"
echo "* If you use another port, please change UFW rules manually       *"
echo "* Here is the current configuration                               *"
ufw status
