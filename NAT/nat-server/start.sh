#!/bin/bash

route del default
ifconfig eth0 down

iptables -F
iptables -t nat -F
iptables -t nat --delete-chain
 
iptables -t nat -A POSTROUTING --out-interface eth2 -j MASQUERADE
iptables -t nat -A POSTROUTING --out-interface eth1 -j MASQUERADE
iptables -A FORWARD --in-interface eth1 -j ACCEPT

 
# service iptables save
# service iptables restart
#  
# service network restart
