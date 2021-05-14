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
echo "* Updating to Linux kernel version (1) 5.11.17 OR (2) 5.12.4        *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.17/amd64/linux-headers-5.11.17-051117-generic_5.11.17-051117.202104281235_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.17/amd64/linux-headers-5.11.17-051117_5.11.17-051117.202104281235_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.17/amd64/linux-image-unsigned-5.11.17-051117-generic_5.11.17-051117.202104281235_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.17/amd64/linux-modules-5.11.17-051117-generic_5.11.17-051117.202104281235_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.11.17   (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12.4/amd64/linux-headers-5.12.4-051204-generic_5.12.4-051204.202105140931_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12.4/amd64/linux-headers-5.12.4-051204_5.12.4-051204.202105140931_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12.4/amd64/linux-image-unsigned-5.12.4-051204-generic_5.12.4-051204.202105140931_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12.4/amd64/linux-modules-5.12.4-051204-generic_5.12.4-051204.202105140931_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.12.4           ...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
