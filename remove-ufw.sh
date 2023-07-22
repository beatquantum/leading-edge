#!/bin/bash

# Author: Santosh Pandit
# Purpose: This script completely removes ufw from an Ubuntu server.

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

# Clean up any residual configurations
sudo apt autoremove
sudo apt autoclean

echo "UFW has been completely removed from the system."
