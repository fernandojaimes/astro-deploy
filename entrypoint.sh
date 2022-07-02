#!/bin/bash
apt update 
apt upgrade -y 
apt install curl -y 
apt install zip -y 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
unzip awscliv2.zip 
./aws/install -y
