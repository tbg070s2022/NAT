#!/bin/bash

cd nat-server
sudo docker build -t nat-server .
sudo docker network create ntw1
sudo docker network create ntw2
sudo docker run -itd --privileged --name nat nat-server sleep infinity
sudo docker network connect ntw1 nat 
sudo docker network connect ntw2 nat 
cd ..

cd nat-client
sudo docker build -t nat-client .
sudo docker run -itd --privileged --network ntw1 --name client1 nat-client 
sudo docker run -itd --privileged --network ntw2 --name client2 nat-client 

