#!/bin/bash
apt update
apt install sudo make
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
echo "* Updating to OpenSSH version 9.0p1                               *"
echo "* Source: https://www.openssh.com                                 *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1 : Installing required package dependencies...*"
sudo apt-get update > /dev/null
sudo apt-get install build-essential zlib1g-dev libssl-dev libpam0g-dev libselinux1-dev -y > /dev/null
mkdir /var/lib/sshd > /dev/null
chmod -R 700 /var/lib/sshd/ > /dev/null
useradd -r -U -d /var/lib/sshd/ -c "sshd privsep" -s /bin/false sshd > /dev/null
echo "*(Ignore if you saw an error message- user 'sshd' already exists. *"
echo "* Step 2 : Downloading OpenSSH...*"
wget -c --no-check-certificate https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.0p1.tar.gz > /dev/null
tar -xzf openssh-9.0p1.tar.gz  > /dev/null
cd openssh-9.0p1/  > /dev/null
echo "* Step 3 : Configuring SSH with PAM *"
./configure --with-pam --with-selinux --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh > /dev/null
echo "* Step 4 : Installing OpenSSH...(have patience!) *"
echo "* Running make... *"
make > /dev/null
echo "* Running make install... *"
make install > /dev/null
echo "* Reboot at your convenience and check the kernel using ssh -V    *"
echo "*******************************************************************"
fi
