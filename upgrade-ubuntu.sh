#!/bin/bash

# Author: Santosh Pandit
# Purpose: Upgrade Ubuntu from LTS to latest non-LTS via cli
# Last update: 22 July 2023

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Backup your important data and configurations
# (Ensure you have a full backup before proceeding)

# Update package list and upgrade current system
sudo apt update
sudo apt upgrade

# Install the update-manager-core package
sudo apt install update-manager-core

# Set the Prompt value to normal in the release-upgrades file
sudo sed -i 's/Prompt=lts/Prompt=normal/' /etc/update-manager/release-upgrades

# Perform the distribution upgrade
sudo do-release-upgrade

# If you encounter any prompts during the upgrade process, carefully review and confirm them.

echo "Ubuntu server has been upgraded to the latest non-LTS version."
