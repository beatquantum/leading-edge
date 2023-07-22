#!/bin/bash

# Author: Santosh Pandit
# Purpose: Remove multipathd completely from Ubuntu server.
# Last update: 22 July 2023

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Stop multipathd service
sudo systemctl stop multipathd

# Disable multipathd service on boot
sudo systemctl disable multipathd

# Remove multipath-tools package
sudo apt remove --purge multipath-tools

# Clean up any residual configurations
sudo apt autoremove
sudo apt autoclean

echo "multipathd has been completely removed from the system."
