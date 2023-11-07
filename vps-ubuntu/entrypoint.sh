#!/bin/bash
cd /home/container
export HOME=/home/container

# Default the TZ environment variable to ETC.
TZ=${TZ:-ETC/GMT+1}
export TZ

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

if [ ! -f ./start.sh ]; then
    echo "start.sh not found! Downloading..."
    curl -sSL -o ./start.sh https://raw.githubusercontent.com/Limmek/Pterodactyl-eggs/main/vps-ubuntu/start.sh
    chmod +x ./start.sh
fi

# Run the Server
eval ${MODIFIED_STARTUP}
