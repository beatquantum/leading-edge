#!/bin/bash

# Author: Santosh Pandit
# Purpose: Completely remove ufw from Ubuntu server
# Last update: 22 July 2023
# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Stop and disable UFW
sudo ufw disable
sudo systemctl stop ufw
sudo systemctl disable ufw

# Remove UFW package
sudo apt remove --purge ufw

# Remove UFW configuration files and directories
sudo rm -rf /etc/ufw
sudo rm -rf /lib/ufw
sudo rm -rf /usr/share/ufw

# Clean up any residual configurations
sudo apt autoremove
sudo apt autoclean

# Remove UFW-related symbolic links
sudo find /etc -type l -lname '/etc/ufw/*' -delete

# Remove UFW executables from PATH
sudo sed -i '/\/usr\/sbin\/ufw/d' /etc/environment
sudo sed -i '/\/usr\/bin\/ufw/d' /etc/environment

# Reset environment variables
hash -r

echo "UFW has been completely removed from the system. (suggest reboot)"
