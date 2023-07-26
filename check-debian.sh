#!/bin/bash

Author: Santosh Pandit
Purpose: To check if Debian is installed
Last update: 26 July 2023

# Get the OS name from /etc/os-release
os_name=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')

# Check if the OS is "Debian"
if [[ "$os_name" == *"Debian"* ]]; then
    echo "Debian is found."
else
    echo "Please use Debian and continue."
fi
