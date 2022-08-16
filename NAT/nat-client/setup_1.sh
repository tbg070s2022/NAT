#! /bin/bash

NAT1_IP=$(sudo docker inspect -f '{{range.NetworkSettings.Networks.ntw1}}{{.IPAddress}}{{end}}' nat)
CLIENT1_IP=$(sudo docker network inspect -f '{{range.IPAM.Config}}{{.Subnet}}{{end}}' ntw2)
route del default
route add -net $CLIENT1_IP netmask 255.255.0.0 gw $NAT1_IP eth0