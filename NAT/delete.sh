#!/bin/bash

sudo docker kill nat client1 client2
sudo docker rm nat client1 client2

sudo docker rmi nat-client nat-server

sudo docker network rm ntw1
sudo docker network rm ntw2
