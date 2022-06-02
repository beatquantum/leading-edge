#!/bin/bash
# "*******************************************************************"
# "* Always use every script thoroughly in a test environment first. *"
# "*******************************************************************"
# "* Source: https://github.com/beatquantum/leading-edge.git         *"
# "* Author: Santosh Pandit                                          *"
# "*******************************************************************"
echo "*******************************************************************"
echo "* Basic Stuff                                                     *"
apt-get update
apt-get upgrade -y
echo "*******************************************************************"
echo "* Do you wish to install basic programs e.g. sudo                 *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
sh basic.sh
fi
echo "*******************************************************************"
echo "* Do you wish to use Debian Unstable?                             *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
sh unstable.sh
fi
echo "*******************************************************************"
echo "* Do you wish to use the sshd_config prototoype                   *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
cp sshd_config /etc/ssh/
fi
echo "*******************************************************************"
echo "* Do you wish to use the sysctl.conf prototoype                   *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
cp sysctl.conf /etc/
fi
echo "*******************************************************************"
echo "* Do you wish to disable kernel dumps                             *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
sh dump.sh
fi
echo "*******************************************************************"
echo "* Do you wish to harden filesystem and protocols                  *"
echo "* Enter 1 or 2 to skip, or Ctrl-C to abort                        *"
read n
if [ $n -eq 1 ];
then
sh filesystem.sh
fi
