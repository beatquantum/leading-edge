#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* This script install MFA with SSH Keys and Authenticator         *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "* Step 1 - Installing Google Authenticator *"
apt-get update > /dev/null
apt-get install google-authenticator -y > /dev/null
echo "* Please remember the response sequence y, y, y, n, y             *"
google-authenticator
echo "* Step 2 : Taking backup of important files. Remember these if you need! *"
cp /etc/pam.d/sshd /etc/pam.d/sshd-backup
cp /etc/ssh/sshd_config /etc/ssh/sshd_config-backup
echo "* Step 3 : Making changes to /etc/pam.d/sshd and /etc/ssh/sshd_config *"
echo "auth required pam_google_authenticator.so nullok" >> /etc/pam.d/sshd
echo "auth required pam_permit.so" >> /etc/pam.d/sshd
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
echo "* Step 4 - Restarting sshd for the first time *"
systemctl restart sshd.service
echo "* IMPORTANT - Do not close this window. Open a separate SSH windows and ensure it works. *"
echo "* If all goes okay, then press 1 to continue or Ctrl-C to abort *"
read c
if [ $c -eq 1 ];
then
echo "* Step 5 - Including AuthenticationMethods in sshd_config *"
echo "AuthenticationMethods publickey,password publickey,keyboard-interactive" >> /etc/ssh/sshd_config
sed -i 's/@include common-auth/#@include common-auth/g' /etc/pam.d/sshd
echo "* Step 6 - Restarting sshd for the second time *"
systemctl restart sshd.service
echo "* IMPORTANT - Do not close this window. Open a separate SSH windows and ensure it works. *"
echo "* If all goes okay, then press 1 to continue or Ctrl-C to abort *"
read c
if [ $c -eq 1 ];
then
echo "It seems all was good. Remember you have two backup files if there is a problem."
fi
fi
fi
