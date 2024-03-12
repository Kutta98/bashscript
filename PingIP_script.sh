#!/bin/bash

# List of IP addresses to ping
ip_addresses=( "192.168.1.195"  "192.168.1.156")
current_time=$(date +"%Y-%m-%d %H:%M:%S")

# Function to perform ping and check online/offline status
check_online() {
    local ip=$1
    if ping -c 5 -W 1 "$ip" &>/dev/null; then
        echo "$ip is working online $current_time"
	#echo " SERVER IS ONLINE $current_time " | mail -s "Server Status" gokulnath.b@golden-hippo.com
    else
        echo -e "$ip Gone offline.... Gone offline.... $current_time \n Gone offline....  Gone offline...."
	echo "Check the $ip device status..." 
        echo " OUR ATTENDANCE SERVER IS DOWN $current_time " | mail -s "Server Status" gokulnath.b@golden-hippo.com  rajesh.r@golden-hippo.com

    fi
}

# Loop through the list of IP addresses and check online/offline status
for ip in "${ip_addresses[@]}"; do
    check_online "$ip" &
done

# Wait for all background processes to finish
wait





