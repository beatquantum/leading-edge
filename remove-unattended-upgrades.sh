#!/bin/bash

# Author: Santosh Pandit
# Purpose: Remove unattended upgrades completely from Ubuntu server.
# Last update: 22 July 2023

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Stop the unattended-upgrades service
sudo systemctl stop unattended-upgrades

# Disable the unattended-upgrades service on boot
sudo systemctl disable unattended-upgrades

# Remove the unattended-upgrades package
sudo apt remove --purge unattended-upgrades

# Remove the /var/log/unattended-upgrades directory if it exists and is not empty
if [ -d "/var/log/unattended-upgrades" ]; then
  sudo rm -rf /var/log/unattended-upgrades
fi

# Clean up any residual configurations
sudo apt autoremove
sudo apt autoclean

echo "unattended-upgrades has been completely removed from the system."
