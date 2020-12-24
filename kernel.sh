#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Your current kernel is below                                    *"
uname -a
echo "*******************************************************************"
echo "* Updating to Linux kernel version 5.10.2                          *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.2/amd64/linux-headers-5.10.2-051002-generic_5.10.2-051002.202012210832_amd64.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.2/amd64/linux-headers-5.10.2-051002_5.10.2-051002.202012210832_all.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.2/amd64/linux-image-unsigned-5.10.2-051002-generic_5.10.2-051002.202012210832_amd64.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.2/amd64/linux-modules-5.10.2-051002-generic_5.10.2-051002.202012210832_amd64.deb > /dev/null
echo "* Step 2 : Updating Linux kernel...(this will take a couple of minutes)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
