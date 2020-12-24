#!/bin/bash
clear
echo "*******************************************************************"
echo "* Always use every script thoroughly in a test environment first. *"
echo "*******************************************************************"
echo "* Source: https://github.com/beatquantum/leading-edge.git         *"
echo "* Author: Santosh Pandit                                          *"
echo "*******************************************************************"
echo "* IMPORTANT - These values work for me. They may not work for you.*"
echo "*******************************************************************"
echo "* Updating sysctl.conf                                            *"
echo "* Enter 1 to continue, or Ctrl-C to abort                         *"
read n
if [ $n -eq 1 ];
then
echo "fs.suid_dumpable=0" >> /etc/sysctl.conf
echo "kernel.kptr_restrict=2" >> /etc/sysctl.conf
echo "kernel.core_uses_pid=1" >> /etc/sysctl.conf
echo "kernel.dmesg_restrict=1" >> /etc/sysctl.conf
echo "kernel.sysrq=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.log_martians=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.log_martians=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_redirects=0" >> /etc/sysctl.conf
echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.accept_ra=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_ra=0" >> /etc/sysctl.conf
echo "dev.tty.ldisc_autoload=0" >> /etc/sysctl.conf
echo "fs.protected_fifos=2" >> /etc/sysctl.conf
echo "kernel.perf_event_paranoid=3" >> /etc/sysctl.conf
echo "kernel.unprivileged_bpf_disabled=1" >> /etc/sysctl.conf
echo "net.core.bpf_jit_harden=2" >> /etc/sysctl.conf
echo "*****************************************************"
echo "* Do not forget to use sysctl -p after every boot!  *"
echo "*****************************************************"
fi
