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
echo "Changing default DAEMON_ARGS to -w 4096"
sed -i 's/\#DAEMON_ARGS=\"\"/DAEMON_ARGS=\"-w 4096\"/g' /etc/default/haveged
echo "Setting haveged to run automatically"
update-rc.d haveged defaults
echo "Running FIPS rng test 10,000 times"
cat /dev/random | rngtest -c 10000
echo "I hope you did not get more than 10 errors above"
