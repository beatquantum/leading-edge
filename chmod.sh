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
read -r n

if [ "$n" -eq 1 ]; then
  echo "Restricting access to specific files and folders"
  chmod 600 /boot/grub/grub.cfg 2> /dev/null
  chmod 600 /etc/at.deny 2> /dev/null
  chmod 600 /etc/crontab 2> /dev/null
  chmod 600 /etc/ssh/sshd_config 2> /dev/null
  chmod 700 /etc/cron.d 2> /dev/null
  chmod 700 /etc/cron.daily 2> /dev/null
  chmod 700 /etc/cron.hourly 2> /dev/null
  chmod 700 /etc/cron.weekly 2> /dev/null
  chmod 700 /etc/cron.monthly 2> /dev/null
  chmod 700 /home/nonroot 2> /dev/null
  chmod 700 /home/lynis 2> /dev/null
  chmod 700 /home/leading-edge 2> /dev/null
  chmod 700 /home/harden 2> /dev/null
  chmod o-x /usr/bin/x86_64-linux-gnu-as 2> /dev/null
  chmod o-x /usr/bin/x86_64-linux-gnu-gcc-9 2> /dev/null
  echo "Please ignore any errors. They might occur if the compiler or directory is not installed and do not require hardening."
fi
