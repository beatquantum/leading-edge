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
echo "* Updating to Linux kernel version (1) 5.11 RC-7 OR (2) 5.10.14   *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc7/amd64/linux-headers-5.11.0-051100rc7-generic_5.11.0-051100rc7.202102072330_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc7/amd64/linux-headers-5.11.0-051100rc7_5.11.0-051100rc7.202102072330_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc7/amd64/linux-image-unsigned-5.11.0-051100rc7-generic_5.11.0-051100rc7.202102072330_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc7/amd64/linux-modules-5.11.0-051100rc7-generic_5.11.0-051100rc7.202102072330_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.11-rc7 (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.14/amd64/linux-headers-5.10.14-051014-generic_5.10.14-051014.202102071532_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.14/amd64/linux-headers-5.10.14-051014_5.10.14-051014.202102071532_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.14/amd64/linux-image-unsigned-5.10.14-051014-generic_5.10.14-051014.202102071532_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.14/amd64/linux-modules-5.10.14-051014-generic_5.10.14-051014.202102071532_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.10.14...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi

