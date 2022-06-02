#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Your current OS is below                                        *"
lsb_release -a
echo "*******************************************************************"
echo "* Updating to Debian Unstable                                     *"
echo "* Enter 1 to continue, 2 to undo changes, or Ctrl-C to abort      *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1: Creating /backup folder if needed (ignore error if any) *"
mkdir /backup
echo "* Step 2: Copying existing sources file to /backup                *"
cp /etc/apt/sources.list /backup/ 
echo "* Step 3: Changing the sources.list file                          *"
truncate -s 0 /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ unstable main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ unstable main" >> /etc/apt/sources.list
echo "*******************************************************************"
echo "* Please have a look at the new sources.list file                 *"
cat /etc/apt/sources.list
echo "* Enter 1 to continue, 2 to undo changes, or Ctrl-C to abort      *"
read m
if [ $m -eq 1 ];
then
echo "* Step 4: Updating sources (15 seconds, have patience             *"
apt update > /dev/null
echo "* Step 5: Updating OS to unstable (4 minutes, have some tea!)     *"
apt upgrade -y
apt full-upgrade -y
echo "* Debian has been upgraded to Debian Unstable                     *"
echo "* Reboot and check the OS using lsb_release -a                    *"
echo "*******************************************************************"
fi
if [ $m -eq 2 ];
then
cp /backup/sources.list /etc/apt/
echo "*As requested the original sources.list file has been restored.   *"
echo "*******************************************************************"
fi
fi
if [ $n -eq 2 ];
then
echo "No changes were made to the system. Goodbye.                      *"
echo "*******************************************************************"
fi
