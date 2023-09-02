#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Your current OpenSSH version is the following                   *"
ssh -V
echo "*******************************************************************"
echo "* Updating to OpenSSH version 9.4p1                               *"
echo "* Source: https://www.openssh.com                                 *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read -r n
if [ "$n" -eq 1 ]; then
  echo "* Step 1: Installing required package dependencies... *"
  apt-get update > /dev/null
  apt-get install -y build-essential zlib1g-dev libssl-dev libpam0g-dev libselinux1-dev

  echo "* Step 2: Downloading OpenSSH... *"
  wget -q --show-progress --no-check-certificate https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.4p1.tar.gz
  tar -xf openssh-9.4p1.tar.gz
  cd openssh-9.4p1/

  echo "* Step 3: Configuring SSH with PAM *"
  ./configure --with-pam --with-privsep-path=/var/lib/sshd --sysconfdir=/etc/ssh

  echo "* Step 4: Installing OpenSSH... *"
  echo "* Running make... *"
  make
  echo "* Running make install... *"
  make install

  echo "* Cleaning up... *"
  cd ..
  rm -rf openssh-9.4p1 openssh-9.4p1.tar.gz

  echo "* Reboot at your convenience and check the OpenSSH version using 'ssh -V' *"
  echo "*******************************************************************"
fi
