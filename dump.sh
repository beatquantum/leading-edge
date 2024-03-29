#!/bin/bash -e

clear

echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"

echo "* The script will disable kernel dumps and make miscellaneous improvements *"
echo "* Enter 1 to continue, or Ctrl-C to abort                                 *"
read -r n

if [ "$n" -eq 1 ]; then
  echo "Disabling kernel dumps and setting timeout to 1 hour"

  sudo sh -c 'echo "ulimit -c 0 > /dev/null 2>&1" > /etc/profile.d/disable-coredumps.sh'

  sudo sh -c 'echo "TMOUT=3600" >> /etc/profile'
  sudo sh -c 'echo "readonly TMOUT" >> /etc/profile'
  sudo sh -c 'echo "export TMOUT" >> /etc/profile'

  sudo sh -c 'echo "* hard core 0" >> /etc/security/limits.conf'
  sudo sh -c 'echo "* soft core 0" >> /etc/security/limits.conf'

  echo "* All done. Reboot at your convenience for full effect. *"
fi
