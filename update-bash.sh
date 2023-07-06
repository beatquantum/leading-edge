#!/bin/bash

# Author: Santosh Pandit
# Warning: Always use scripts in a test environment thoroughly.
# Disclaimer: The author accepts no responsibility or liability of any kind due to your use of the script.

# Update packages and install necessary dependencies
sudo apt update
sudo apt install -y build-essential wget

# Download the Bash source code
wget https://ftp.gnu.org/gnu/bash/bash-5.2.tar.gz

# Extract the downloaded file
tar -xzvf bash-5.2.tar.gz

# Change to the extracted directory
cd bash-5.2

# Configure the build environment
./configure --prefix=/usr

# Compile the source code
make

# Install the newly compiled binary
sudo make install

# Verify the installed version
bash --version
