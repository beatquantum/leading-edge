#!/bin/bash

echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* This script creates a non-root user and copies .ssh keys         *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"

read -r n

if [ "$n" -eq 1 ]; then
  echo "* Step 1 - Create a new user named nonroot *"
  adduser nonroot
  usermod -aG sudo nonroot > /dev/null

  echo "* Step 2 - Copy SSH files from root to nonroot *"
  mkdir -p /home/nonroot/.ssh
  cp -rf /root/.ssh/* /home/nonroot/.ssh/
  chown -R nonroot:nonroot /home/nonroot/.ssh
  chmod 700 /home/nonroot
fi

echo "*******************************************************************"
echo "* Now you should be able to access the server using the nonroot   *"
echo "*******************************************************************"
