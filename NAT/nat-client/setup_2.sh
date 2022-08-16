#! /bin/bash

route del default
route add -net 172.20.0.0 netmask 255.255.0.0 gw 172.21.0.2 eth0