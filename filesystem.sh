#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* The script will disable USB and harden filesystem               *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "Blacklisting unwanted mounts and protocols, disabling usb-storage *"
echo "#Lines added by BeatQuantum filesystem.sh script" >> /etc/modprobe.d/blacklist.conf
echo "install cramfs /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install hfs /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install freevxfs /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install hfsplus /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install jffs2 /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install udf /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "blacklist usb-storage" >> /etc/modprobe.d/blacklist.conf
echo "install dccp /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install sctp /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install rds /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install tipc /bin/true" >> /etc/modprobe.d/blacklist.conf
fi
