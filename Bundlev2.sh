#!/bin/bash
#This command is made for aptitude only for right now!
echo "Hello Kordell"
 sleep 2s
# Here are the pre-configured options.
  ALL_OPTIONS="all"
  NO_OPTIONS="none"

echo "Do you want to install all programs or a specific one?"
 read option

# The interpreter will be set here to determine what package maanger the system has.


# The pre-configuration setup is made for apt packages manager.

if [ "$option" == "$ALL_OPTIONS" ]; then
 echo "Installing necessary software"
  sudo apt-get update
  sudo apt-get autoclean
 echo "Installing ClamAV and CLamTK"
  sudo apt-get install -y clamav
  sudo apt-get autoclean
  sudo apt-get install -y clamtk
  sudo apt-get install autoclean
 echo "Installing cracklib"
  sudo apt-get install -y libpam-cracklib
  sudo apt-get autoclean
 echo "Installing ecryptfs"
  sudo apt-get install -y ecryptfs-utils
  sudo apt-get autoclean
 echo "Installing ufw"
  sudo apt-get install -y ufw
  sudo apt-get autoclean
  sudo ufw enable
 echo "Installing lynis"
  sudo apt-get install -y lynis
  sudo apt-get autoclean
 echo "Installing htop"
  sudo apt-get install -y htop
  sudo apt-get autoclean
 echo "Installing DTACH"
  sudo apt-get install -y dtach dvtm
  sudo apt-get autoclean
 echo  "Installing Midnight Commander"
  sudo apt-get install -y mc
  sudo apt-get autoclean
 echo "Installing rkhunter"
  sudo apt-get install -y rkhunter
  sudo apt-get autoclean
  sudo rkhunter -c
 echo "Installing snap"
  sudo apt install -y snap
 echo "Installing s-tui"
  sudo apt install -y python-pip stress
  sudo pip install s-tui
  sudo apt-get autoclean
else

 echo "what specifically do you want?"

 read pak1
# The script reads the user response and tries to install the package.

  sudo apt-get install -y $pak1
fi
