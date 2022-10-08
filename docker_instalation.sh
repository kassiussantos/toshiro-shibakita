#!/bin/bash

echo "updating server and install package"
apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y 

echo "Add Docker GPG key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
 	$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Install Docker"
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

systemctl enable docker
usermod -aG docker ${USER}