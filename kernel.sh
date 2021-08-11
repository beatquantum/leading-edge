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
echo "* Updating to Linux kernel version (1) 5.14-rc2 OR (2) 5.13.9    *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14-rc2/amd64/linux-headers-5.14.0-051400rc2-generic_5.14.0-051400rc2.202107182230_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14-rc2/amd64/linux-headers-5.14.0-051400rc2_5.14.0-051400rc2.202107182230_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14-rc2/amd64/linux-image-unsigned-5.14.0-051400rc2-generic_5.14.0-051400rc2.202107182230_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14-rc2/amd64/linux-modules-5.14.0-051400rc2-generic_5.14.0-051400rc2.202107182230_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.14-rc2 (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13.9/amd64/linux-headers-5.13.9-051309-generic_5.13.9-051309.202108080438_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13.9/amd64/linux-headers-5.13.9-051309_5.13.9-051309.202108080438_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13.9/amd64/linux-image-unsigned-5.13.9-051309-generic_5.13.9-051309.202108080438_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13.9/amd64/linux-modules-5.13.9-051309-generic_5.13.9-051309.202108080438_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.13.9        ...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
