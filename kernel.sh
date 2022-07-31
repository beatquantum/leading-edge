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
echo "* Updating to Linux kernel version 5.18.15                        *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...                      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.18.15/amd64/linux-headers-5.18.15-051815-generic_5.18.15-051815.202207291649_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.18.15/amd64/linux-headers-5.18.15-051815_5.18.15-051815.202207291649_all.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.18.15/amd64/linux-image-unsigned-5.18.15-051815-generic_5.18.15-051815.202207291649_amd64.deb
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.18.15/amd64/linux-modules-5.18.15-051815-generic_5.18.15-051815.202207291649_amd64.deb

echo "* Step 2 : Updating Linux kernel (patience!)                      *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
