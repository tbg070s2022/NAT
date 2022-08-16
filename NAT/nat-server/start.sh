#!/bin/bash

iptables -F
iptables -t nat -F
iptables -t nat --delete-chain
 
iptables -t nat -A POSTROUTING --out-interface eth1 -j MASQUERADE
iptables -A FORWARD --in-interface eth2 -j ACCEPT
 
service iptables save
service iptables restart
 
service network restart
