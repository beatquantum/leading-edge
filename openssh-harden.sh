#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
rm /etc/ssh/ssh_host_*
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" 
awk '$5 >= 3071' /etc/ssh/moduli > /etc/ssh/moduli.reduced
mv /etc/ssh/moduli.reduced /etc/ssh/moduli
cp sshd_config.example /etc/ssh/sshd_config
cp /usr/sbin/sshd /tmp/sshd.original
cp /tmp/sshd.original /tmp/sshd.new
sed -i 's/OpenSSH_8.4p1 Debian-4/BeatQuantum Inspired../g' /tmp/sshd.new
rm /usr/sbin/sshd
cp /tmp/sshd.new /usr/sbin/sshd
service ssh restart
echo "* Please note port has been changed to 49022. You can change it again in /etc/ssh/sshd_config *"
echo "* =========================================================================================== *"
cat /etc/ssh/sshd_config
echo "* =========================================================================================== *"
