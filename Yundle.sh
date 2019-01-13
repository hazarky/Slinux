#!/bin/bash
echo "Hello Kordell"
sleep 2s

ALL_OPTIONS="all"
NO_OPTIONS="none"

echo "Do you want to install all programs or a specific one?"
read OPTION

if [ "$OPTION" == "$ALL_OPTIONS" ]; then
echo "Installing necessary software"
sudo yum update
sudo yum autoclean
echo "Installing ClamAV and CLamTK"
sudo yum install -y clamav
sudo yum autoclean
sudo yum install -y clamtk
sudo yum install autoclean
echo "Installing cracklib"
sudo yum install -y libpam-cracklib
sudo yum autoclean
echo"Installing ecryptfs"
sudo yum install -y ecryptfs-utils
sudo yum autoclean
echo "Installing ufw"
sudo yum install -y ufw
sudo yum autoclean
sudo ufw enable
echo "Installing lynis"
sudo yum install -y lynis
sudo yum autoclean
echo "Installing htop"
sudo yum install -y htop
sudo yum autoclean
echo "Installing DTACH"
sudo yum install -y dtach dvtm
sudo yum autoclean
echo  "Installing Midnight Commander"
sudo yum install -y mc
sudo yum autoclean
echo "Installing rkhunter"
sudo yum install -y rkhunter
sudo yum autoclean
sudo rkhunter -c
echo "Installing snap"
sudo apt install -y snap
echo "Installing s-tui"
sudo yum install -y python-pip stress
sudo pip install s-tui
sudo yum autoclean
else
echo "what specifically do you want?"

read pak1


sudo yum install -y $pak1
fi
