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
echo "* Updating to Linux kernel version (1) 5.16.3 OR (2) none    *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-headers-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-headers-5.16.3-051603_5.16.3-051603.202201270732_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-image-unsigned-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-modules-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb

echo "* Step 2 : Updating Linux kernel 5.16.3 (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-headers-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-headers-5.16.3-051603_5.16.3-051603.202201270732_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-image-unsigned-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16.3/amd64/linux-modules-5.16.3-051603-generic_5.16.3-051603.202201270732_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.16.3        ...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
