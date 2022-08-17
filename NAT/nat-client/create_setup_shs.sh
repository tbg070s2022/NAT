


NAT1_IP=$(sudo docker inspect nat | jq '.[0].NetworkSettings.Networks.ntw1.IPAddress')
CLIENT1_IP=$(sudo docker network inspect ntw2  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $1"\""}')
NETMASK1=$(sudo docker network inspect ntw1  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $2}' | awk -F'"' '{print $1}' | awk '{num=$1; mask=0; for (i=0; i<num; i++) {mask=or(mask,1); mask=lshift(mask, 1);} for (i=0; i<(31-num); ++i) {mask=lshift(mask, 1);} printf("%d.%d.%d.%d\n", rshift(and(mask, 0xff000000), 24), rshift(and(mask, 0xff0000), 16), rshift(and(mask, 0xff00), 8), and(mask, 0xff));}' )
mkdir -p setup1
echo route del default > setup1/setup.sh
echo route add -net $CLIENT1_IP netmask $NETMASK1 gw $NAT1_IP eth0 >> setup1/setup.sh
chmod +x setup1/setup.sh

NAT2_IP=$(sudo docker inspect nat | jq '.[0].NetworkSettings.Networks.ntw2.IPAddress')
CLIENT2_IP=$(sudo docker network inspect ntw1  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $1"\""}')
NETMASK2=$(sudo docker network inspect ntw2  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $2}' | awk -F'"' '{print $1}' | awk '{num=$1; mask=0; for (i=0; i<num; i++) {mask=or(mask,1); mask=lshift(mask, 1);} for (i=0; i<(31-num); ++i) {mask=lshift(mask, 1);} printf("%d.%d.%d.%d\n", rshift(and(mask, 0xff000000), 24), rshift(and(mask, 0xff0000), 16), rshift(and(mask, 0xff00), 8), and(mask, 0xff));}' )
mkdir -p setup2
echo route del default > setup2/setup.sh
echo route add -net $CLIENT2_IP netmask $NETMASK2 gw $NAT2_IP eth0 >> setup2/setup.sh
chmod +x setup2/setup.sh

