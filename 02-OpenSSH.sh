#!/bin/bash
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* Updating to OpenSSH version 8.4p1                               *"
echo "* Source: https://www.openssh.com                                 *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Installing required package dependencies...                     *"
sudo apt-get install build-essential zlib1g-dev libssl-dev libpam0g-dev libselinux1-dev -y 
mkdir /var/lib/sshd 
chmod -R 700 /var/lib/sshd/ 
useradd -r -U -d /var/lib/sshd/ -c "sshd privsep" -s /bin/false sshd 
echo "*(Ignore if you saw an error message- user 'sshd' already exists. *"
echo "* Downloading OpenSSH...                                          *"
wget -c --no-check-certificate https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz 
tar -xzf openssh-8.4p1.tar.gz 
cd openssh-8.4p1/ 
echo "* Configuring SSH without PAM                                     *"
./configure --with-md5-passwords --with-selinux --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh 
echo "* Installing OpenSSH...(have patience!)                           *"
echo "* Running make...                                                 *"
make
echo "* Running make install...                                              *"
make install 
echo "* Reboot at your convenience and check the kernel using ssh -V    *"
echo "*******************************************************************"
fi
