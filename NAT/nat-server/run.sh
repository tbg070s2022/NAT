#! /bin/bash
docker rm nat
sudo docker run -d --privileged --name nat nat-server
sudo docker network connect ntw1 nat 
sudo docker network connect ntw2 nat 

