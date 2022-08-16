#! /bin/bash

NAT2_IP=$(sudo docker inspect -f '{{range.NetworkSettings.Networks.ntw2}}{{.IPAddress}}{{end}}' nat)
CLIENT2_IP=$(sudo docker network inspect -f '{{range.IPAM.Config}}{{.Subnet}}{{end}}' ntw1)
route del default
route add -net $CLIENT2_IP netmask 255.255.0.0 gw $NAT2_IP eth0