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
echo "* Updating to Linux kernel version (1) 5.11.11 OR (2) 5.12-rc6    *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.11/amd64/linux-headers-5.11.11-051111-generic_5.11.11-051111.202103310025_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.11/amd64/linux-headers-5.11.11-051111_5.11.11-051111.202103310025_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.11/amd64/linux-image-unsigned-5.11.11-051111-generic_5.11.11-051111.202103310025_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.11/amd64/linux-modules-5.11.11-051111-generic_5.11.11-051111.202103310025_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.11.11   (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12-rc6/amd64/linux-headers-5.12.0-051200rc6-generic_5.12.0-051200rc6.202104042231_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12-rc6/amd64/linux-headers-5.12.0-051200rc6_5.12.0-051200rc6.202104042231_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12-rc6/amd64/linux-image-unsigned-5.12.0-051200rc6-generic_5.12.0-051200rc6.202104042231_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12-rc6/amd64/linux-modules-5.12.0-051200rc6-generic_5.12.0-051200rc6.202104042231_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.12-rc6       ...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
