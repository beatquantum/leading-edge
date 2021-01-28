#!/bin/bash
# "*******************************************************************"
# "* Always use every script thoroughly in a test environment first. *"
# "*******************************************************************"
# "* Source: https://github.com/beatquantum/leading-edge.git         *"
# "* Author: Santosh Pandit                                          *"
# "*******************************************************************"
# "* This script clears Linux logs and journal                       *"
rm /var/log/*.gz > /dev/null
rm /var/log/*.0 > /dev/null
rm /var/log/*.1 > /dev/null
truncate -s 0 /var/log/* > /dev/null
rm /var/log/apache2/*.gz > /dev/null
rm /var/log/apache2/*.1 > /dev/null
truncate -s 0 /var/log/apache2/*.log > /dev/null
rm /var/log/nginx/*.gz > /dev/null
rm /var/log/nginx/*.1 > /dev/null
truncate -s 0 /var/log/nginx/*.log > /dev/null
journalctl --vacuum-size=1M
