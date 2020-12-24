#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* This script creates a nonroot user and copies .ssh keys         *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1 - Create a new user named nonroot *"
adduser nonroot
usermod -aG sudo nonroot > /dev/null
echo "* Step 2 - Copy SSH files for root to nonroot" *"
sudo mkdir /home/nonroot/.ssh > /dev/null
sudo cp -rf /root/.ssh/* /home/nonroot/.ssh/ > /dev/null
chown -R nonroot:nonroot /home/nonroot/.ssh > /dev/null
chmod 700 /home/nonroot > /dev/null
fi
echo "*******************************************************************"
echo "* Now you should be able to access the server using nonroot       *"
echo "*******************************************************************"
