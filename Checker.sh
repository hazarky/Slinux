#!/bin/bash
USER=$(whoami)
echo "Hello $USER"
ss -plunt | awk '{print $6,$7}' #Checks if any listening connections and their process id
#ss -plunt | awk '{print $6,$7}' | grep -v -e "0.0.0.0" -e "[::]:*"
