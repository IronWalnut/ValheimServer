#!/bin/bash

##################################################################
# Notes: This script is run as sudo by crontab on server reboot. #
# It will push a backup the world, then start the server.        #
# All directory references are relative to this script.          #
##################################################################
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
export TERM=xterm

echo "$PWD"

######## Change Directory to Valheim Server Dir ########
VALHEIM_SERVER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$VALHEIM_SERVER_DIR"


######## Wait for networking stuff to come online ########
echo "Waiting 120 seconds..."
# sleep 120

######## Run Server GitHub Backup ########
# Create commit on all files with timestamp as message
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Committing Changes..."
sudo git add -A && sudo git commit -a -m "$CURRENT_TIME"

# Push to GitHub using SSH (as root)
echo "Pushing to Github..."
sudo git push origin master -v

######## Start Valheim Server ########
# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
echo "$PWD"
echo "Starting Server..."
echo "$PWD"
cd "$VALHEIM_SERVER_DIR" && sudo ./valheim_server.x86_64 -name "WaltonNet" -port 2456 -world "Baconator" -password "keviniscool"

export LD_LIBRARY_PATH=$templdpath

