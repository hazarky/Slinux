#!/usr/bin/env bash
sudo systemctl start firewalld.service
#block apipa and loopback ports
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" source address="169.254.0.0/24" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" source address="127.0.0.1" drop'
#block telnet and ftp prptocols
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="80" protocol="tcp" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="21" protocol="tcp" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="23" protocol="udp" drop'

echo 1. add a service.
echo 2. remove a service.
echo 3. block a specific address on public zone.
echo 4. block a specific port on public zone.
echo 5. block a specific address and port on the public zone.
echo 6. Exit.
read -p"Enter a number from above:" num
if [$num == "1"] then
  read -p "Enter a service:" ser
  sudo firewall-cmd --permanent --zone="public" --add-service=$ser
if [$num == "2"] then
  sudo firewall-cmd --list-all
  read -p "Enter a service:" ser
  sudo firewall-cmd --permanent --zone="public" --remove-service=$ser
if [$num == "3"] then
  sudo firewall-cmd --list-all
read -p "Enter a specific address on public zone:" add
sudoi firewall-cmd --permanent --zone="public -removead"
