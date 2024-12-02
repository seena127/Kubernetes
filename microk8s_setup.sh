#!/bin/bash

echo "updating packages"

sudo apt-get update -y

echo " docker installation"

sudo apt-get install docker.io

sudo usermod -aG docker ubuntu

newgrp docker

sudo apt-get install python3-pip

echo " microk8s installation"

sudo snap install microk8s --classic

echo "device status------------------------------------------------------------------------------------------------------------------------------------"

sudo microk8s status

echo "--------------------------------------------------------------------------------------------------------------------------------------------------"

sudo usermod -aG microk8s ubuntu

newgrp microk8s

sudo microk8s enable dns storage ingress
