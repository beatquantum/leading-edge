#!/bin/bash

## SCRIPT BY SANTOSH PANDIT

#SET VARIABLES
OPEN_IN_TCP=25,80,443,853,49022
OPEN_IN_UDP=80,443,49820
OPEN_OUT_TCP=22,25,53,80,443
OPEN_OUT_UDP=53,123,443

# CLEAN THE EXISTING RULES IN IPTABLES AND IP6TABLES
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

ip6tables -F
ip6tables -X
ip6tables -Z
ip6tables -t nat -F
ip6tables -t nat -X
ip6tables -t mangle -F
ip6tables -t mangle -X
ip6tables -t raw -F
ip6tables -t raw -X

# Accept incoming related or established traffic
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT

# Accept outgoing related or established traffic
iptables -A OUTPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A OUTPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A OUTPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow the wg0 network traffic
iptables -A INPUT -s 10.200.200.0/24 -j ACCEPT
ip6tables -A INPUT -s fd86:ea04:1115::0/64 -j ACCEPT

# Allow wireguard VPN traffic
iptables -A FORWARD -i eth0 -o wg0 -j ACCEPT
iptables -A FORWARD -i wg0 -o eth0 -j ACCEPT
ip6tables -A FORWARD -i eth0 -o wg0 -j ACCEPT
ip6tables -A FORWARD -i wg0 -o eth0 -j ACCEPT

# Accept connections on wireguard custom udp port immediately
iptables -I INPUT 1 -i eth0 -p udp --dport 49820 -j ACCEPT
ip6tables -I INPUT 1 -i eth0 -p udp --dport 49820 -j ACCEPT

# Accept MDNS broadcast
iptables -I INPUT -p udp -d 224.0.0.251 --dport 5353 -j ACCEPT

# Allow multicast upnp discovery
iptables -I INPUT -p udp -d 239.255.255.250 --dport 1900 -j ACCEPT

# Allow loopbacks
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT

# OPENING INPUT AND OUTPUT PORTS

for port in $(echo $OPEN_IN_TCP | sed "s/,/ /g"); do
    iptables -A INPUT -i eth0 -p tcp --dport $port -m state --state NEW -m limit --limit 50/min --limit-burst 20 -j ACCEPT
    ip6tables -A INPUT -i eth0 -p tcp --dport $port -m state --state NEW -m limit --limit 50/min --limit-burst 20 -j ACCEPT
done

for port in $(echo $OPEN_IN_UDP | sed "s/,/ /g"); do
    iptables -A INPUT -i eth0 -p udp --dport $port -m state --state NEW -m limit --limit 50/min --limit-burst 20 -j ACCEPT
    ip6tables -A INPUT -i eth0 -p udp --dport $port -m state --state NEW -m limit --limit 50/min --limit-burst 20 -j ACCEPT
done

for port in $(echo $OPEN_OUT_TCP | sed "s/,/ /g"); do
    iptables -A OUTPUT -o eth0 -p tcp --dport $port -m state --state NEW,ESTABLISHED -j ACCEPT
    ip6tables -A OUTPUT -o eth0 -p tcp --dport $port -m state --state NEW,ESTABLISHED -j ACCEPT
done

for port in $(echo $OPEN_OUT_UDP | sed "s/,/ /g"); do
    iptables -A OUTPUT -o eth0 -p udp --dport $port -m state --state NEW,ESTABLISHED -j ACCEPT
    ip6tables -A OUTPUT -o eth0 -p udp --dport $port -m state --state NEW,ESTABLISHED -j ACCEPT
done

# Drop traffic to ports which are served only via the VPN
iptables -A INPUT -p tcp -m multiport --dports 53,81 ! -s 10.200.200.0/24 -j DROP
iptables -A INPUT -p udp -m multiport --dports 53,81 ! -s 10.200.200.0/24 -j DROP
ip6tables -A INPUT -p tcp -m multiport --dports 53,81 ! -s fd86:ea04:1115::0/64 -j DROP
ip6tables -A INPUT -p udp -m multiport --dports 53,81 ! -s fd86:ea04:1115::0/64 -j DROP

# Rate limiting the ICMP requests
iptables -A INPUT -p icmp -m limit --limit 1/second --limit-burst 1 -j ACCEPT
ip6tables -A INPUT -p icmpv6 -m limit --limit 1/second --limit-burst 1 -j ACCEPT

# Setting default policies to DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT DROP


