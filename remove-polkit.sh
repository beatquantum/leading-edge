#!/bin/bash

# Author: Santosh Pandit
# Purpose: Remove polkit completely from Ubuntu server
# Last update: 22 July 2023

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Stop polkitd service
sudo systemctl stop polkit

# Disable polkitd service on boot
sudo systemctl disable polkit

# Remove polkit package
sudo apt remove --purge policykit-1

# Clean up any residual configurations
sudo apt autoremove
sudo apt autoclean

echo "polkitd has been completely removed from the system."
