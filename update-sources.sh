#!/bin/bash

# Author: Santosh Pandit
# Purpose: Replace the existing sources with the testing sources
# Last upate: 26 July 2023

# The new contents for the sources.list file
new_sources_list="deb http://ftp.debian.org/debian testing main non-free-firmware
deb-src http://ftp.debian.org/debian testing main non-free-firmware"

# Backup the existing sources.list file (optional but recommended)
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Write the new contents to the sources.list file
echo "$new_sources_list" > /etc/apt/sources.list

# Update the package lists
apt update
