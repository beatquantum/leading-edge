#!/bin/bash

# Check if the Operating System is Debian
os_name=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
if [[ "$os_name" != "Debian GNU/Linux" ]]; then
    echo "Please use Debian and continue."
    exit 1
fi

# Check if the Operating System is Debian Testing or Debian Trixie
version_codename=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
if [[ "$version_codename" == *"testing"* ]] || [[ "$version_codename" == *"trixie"* ]]; then
    echo "Debian Testing or Debian Trixie is installed. Please use Debian Stable and continue."
    exit 1
fi

# Edit the sources.list file
new_sources_list="deb http://ftp.debian.org/debian testing main non-free-firmware
deb-src http://ftp.debian.org/debian testing main non-free-firmware"
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "$new_sources_list" > /etc/apt/sources.list

# Update package lists
apt update

# Upgrade packages without installing new ones
apt-get upgrade --without-new-pkgs -y

# Upgrade all packages
apt-get upgrade -y

# Suggest user to reboot
echo "Upgrade completed. It's recommended to reboot the system."
