


NAT1_IP=$(sudo docker inspect nat | jq '.[0].NetworkSettings.Networks.ntw1.IPAddress')
CLIENT1_IP=$(sudo docker network inspect ntw2  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $1"\""}')
mkdir -p setup1
echo route del default > setup1/setup.sh
echo route add -net $CLIENT1_IP netmask 255.255.0.0 gw $NAT1_IP eth0 >> setup1/setup.sh
chmod +x setup1/setup.sh

NAT2_IP=$(sudo docker inspect nat | jq '.[0].NetworkSettings.Networks.ntw2.IPAddress')
CLIENT2_IP=$(sudo docker network inspect ntw1  | jq '.[0].IPAM.Config[0].Subnet' | awk -F'/' '{print $1"\""}')
mkdir -p setup2
echo route del default > setup2/setup.sh
echo route add -net $CLIENT2_IP netmask 255.255.0.0 gw $NAT2_IP eth0 >> setup2/setup.sh
chmod +x setup2/setup.sh

