#!/usr/bin/env bash
sudo systemctl start firewalld.service
#block apipa and loopback ports
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" source address="169.254.0.0/24" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" source address="127.0.0.1" drop'
#block telnet and ftp prptocols
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="80" protocol="tcp" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="21" protocol="tcp" drop'
sudo firewall-cmd --permanent --zone="public" --add-rich-rule='rule family="ipv4" port port="23" protocol="udp" drop'
sudo systemctl restart firewalld.service
echo Basic Configuration is set up
