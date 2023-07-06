#!/bin/bash

#Author: Santosh Pandit
#Always be careful with scripts. Test thoroughly on a test server first.
#No guarantees. No liability accepted.

# Check for existing swap file
if [[ $(swapon --show=filename --noheadings) ]]; then
    echo "Swap file already exists"
else
    # Ask for the size of the swap file to be created
    echo -n "Swap file not found. Enter the size in GB for new swap file: "
    read swap_size

    # Ensure the user input is a positive integer
    if ! [[ "$swap_size" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a positive integer."
        exit 1
    fi

    # Create the swap file
    fallocate -l ${swap_size}G /swapfile

    # Set the correct permissions
    chmod 600 /swapfile

    # Setup the swap area
    mkswap /swapfile

    # Enable the swap file
    swapon /swapfile

    # Add the swap file to /etc/fstab
    echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

    # Show the user the swap file details
    swapon --show
fi
