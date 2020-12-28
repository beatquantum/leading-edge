!/bin/bash
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
echo "* Updating to Linux kernel version 5.10.3                          *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
cd /tmp > /dev/null
echo "* Step 1 : Downloading Linux kernel files...(this will take a minute)      *"
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.3/amd64/linux-headers-5.10.3-051003-generic_5.10.3-051003.202012261630_amd64.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.3/amd64/linux-headers-5.10.3-051003_5.10.3-051003.202012261630_all.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.3/amd64/linux-image-unsigned-5.10.3-051003-generic_5.10.3-051003.202012261630_amd64.deb > /dev/null
wget -c --no-check-certificate https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.3/amd64/linux-image-unsigned-5.10.3-051003-generic_5.10.3-051003.202012261630_amd64.deb > /dev/null
echo "* Step 2 : Updating Linux kernel...(this will take a couple of minutes)    *"
dpkg -i *.deb
echo "* Linux kernel has been updated.                                  *"
echo "* Reboot at your convenience and check the kernel using uname -a  *"
echo "*******************************************************************"
fi
