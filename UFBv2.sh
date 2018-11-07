#!/bin/bash
echo "Hello Kordell"
sleep 2s
echo "starting ufw config...."
#Denying incoming messages
sudo ufw default deny incoming
#Deny outgoing messages
sudo ufw default allow outgoing
#Deny Loopback address
sudo ufw deny from 127.0.0.1 to any
#Deny APIPA address
sudo ufw deny from 169.254.0.0/24 to any
#Logging table connections
sudo ufw logging medium
#Enable firewall
sudo ufw enable

read -p "Enter a Port to allow:" port
sudo ufw allow $port 

sudo ufw status
