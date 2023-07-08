#!/bin/bash

# Array of packages to be removed
packages=("multipath-tools" "snapd" "policykit-1" "packagekit")

# Loop through each package
for package in "${packages[@]}"
do
    echo "Removing $package..."
    sudo apt-get purge -y $package
done

# Autoremove to clean up any leftover dependencies
sudo apt-get autoremove -y

# Autoclean to clean up the local repository of retrieved package files
sudo apt-get autoclean

echo "All specified packages have been removed and cleanup complete!"
