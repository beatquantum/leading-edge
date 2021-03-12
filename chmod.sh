#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* The script will harden some files and directories using chmod   *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "Restricting access to specific files and folders"
chmod 600 /boot/grub/grub.cfg > /dev/null
chmod 600 /etc/at.deny > /dev/null
chmod 600 /etc/crontab > /dev/null
chmod 600 /etc/ssh/sshd_config > /dev/null
chmod 700 /etc/cron.d > /dev/null
chmod 700 /etc/cron.daily > /dev/null
chmod 700 /etc/cron.hourly > /dev/null
chmod 700 /etc/cron.weekly > /dev/null
chmod 700 /etc/cron.monthly > /dev/null
chmod 700 /home/nonroot > /dev/null
chmod 700 /home/lynis > /dev/null
chmod 700 /home/leading-edge > /dev/null
chmod 700 /home/harden > /dev/null
chmod o-x /usr/bin/x86_64-linux-gnu-as > /dev/null
chmod o-x /usr/bin/x86_64-linux-gnu-gcc-9 > /dev/null
echo "Please ignore if you saw an error. That is because the compiler or directory is not installed and does not need harden."
fi
