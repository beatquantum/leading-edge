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
echo "* Updating to Linux kernel version (1) 5.11 RC-5 OR (2) 5.10.10   *"
echo "* Enter 1 or 2 to continue, or Ctrl-C to abort                    *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc5/amd64/linux-headers-5.11.0-051100rc5-generic_5.11.0-051100rc5.202101242134_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc5/amd64/linux-headers-5.11.0-051100rc5_5.11.0-051100rc5.202101242134_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc5/amd64/linux-image-unsigned-5.11.0-051100rc5-generic_5.11.0-051100rc5.202101242134_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc5/amd64/linux-modules-5.11.0-051100rc5-generic_5.11.0-051100rc5.202101242134_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.11-rc5 (patience!)             *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
if [ $n -eq 2 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.10/amd64/linux-headers-5.10.10-051010-generic_5.10.10-051010.202101231639_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.10/amd64/linux-headers-5.10.10-051010_5.10.10-051010.202101231639_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.10/amd64/linux-image-unsigned-5.10.10-051010-generic_5.10.10-051010.202101231639_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.10/amd64/linux-modules-5.10.10-051010-generic_5.10.10-051010.202101231639_amd64.deb
echo "* Step 2 : Updating Linux kernel 5.10.10...(patience!)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi

