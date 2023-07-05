#!/bin/bash

clear

echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"

echo "* The script will disable USB and harden the filesystem *"
echo "* Enter 1 to continue, or Ctrl-C to abort               *"
read -r n

if [ "$n" -eq 1 ]; then
  echo "Blacklisting unwanted mounts and protocols, disabling usb-storage"

  # Append lines to the blacklist.conf file
  cat <<EOF >> /etc/modprobe.d/blacklist.conf
# Lines added by BeatQuantum filesystem.sh script
install cramfs /bin/true
install hfs /bin/true
install freevxfs /bin/true
install hfsplus /bin/true
install jffs2 /bin/true
install udf /bin/true
blacklist usb-storage
blacklist firewire-ohci
install dccp /bin/true
install sctp /bin/true
install rds /bin/true
install tipc /bin/true
EOF

  echo "* Changes made in /etc/modprobe.d/blacklist.conf *"
fi

echo "* All done! Changes will be effective after a reboot. Goodbye. *"
