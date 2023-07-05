#!/bin/bash
# "*******************************************************************"
# "* Always use every script thoroughly in a test environment first. *"
# "*******************************************************************"
# "* Source: https://github.com/beatquantum/leading-edge.git         *"
# "* Author: Santosh Pandit                                          *"
# "*******************************************************************"
# "* Install haveged to boost entropy for random number generation   *"
# "*******************************************************************"

echo "Running apt-get update"
apt-get update > /dev/null

echo "Installing haveged and rng-tools"
apt-get install haveged rng-tools -y > /dev/null

echo "Configuring haveged"
sed -i 's/^# DAEMON_ARGS=.*/DAEMON_ARGS="-w 4096"/' /etc/default/haveged

echo "Enabling haveged to run at boot"
systemctl enable haveged

echo "Testing the entropy pool using rngtest"
rngtest -c 10000 > /dev/null 2>&1
if [ "$?" -gt 0 ]; then
    echo "Warning: rngtest detected insufficient entropy."
else
    echo "Entropy test passed. Random number generation improved."
fi
