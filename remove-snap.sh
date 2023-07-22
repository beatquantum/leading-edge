#!/bin/bash

# Author: Santosh Pandit
# Purpose: Remove all snap packages and snap completely from Ubuntu
# Last update: 22.7.2023

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Remove snap packages (lxd, core20, snapd) first
if command -v lxd &> /dev/null; then
  echo "Removing lxd..."
  sudo snap remove lxd --purge
fi

if command -v core20 &> /dev/null; then
  echo "Removing core20..."
  sudo snap remove core20 --purge
fi

if command -v snapd &> /dev/null; then
  echo "Removing snapd..."
  sudo snap remove snapd --purge
fi

# Stop snapd service
sudo systemctl stop snapd

# Remove snapd and its dependencies
sudo apt remove --purge snapd

# Remove any remaining snap directories and files
sudo rm -rf /snap

# Remove any remaining snap-related executables from PATH
sudo sed -i '/\/snap\/bin/d' /etc/environment
sudo sed -i '/\/snap\/usr\/bin/d' /etc/environment

# Reset environment variables
hash -r

echo "snapd, lxd, and core20 have been completely removed from the system."
