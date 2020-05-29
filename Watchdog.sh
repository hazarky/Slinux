#!/bin/bash
NAME=$(whoami)
echo "Hello $NAME"
sudo -s printf '\n==========\nbinary checker\n==========\n' && find /bin/ -type f -mtime -15 && printf '\n==========\nconfig checker\n==========\n' && find /etc/ -type f -mtime -15
