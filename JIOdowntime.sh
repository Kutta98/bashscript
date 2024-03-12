#!/bin/bash

# Function to check packet loss and send notification
check_packet_loss() {
    local ip_address="115.247.219.141"
    local threshold=20

    # Perform the ping
    ping_result=$(ping -c 40 "$ip_address")

    # Extract packet loss percentage from the ping result
    packet_loss=$(echo "$ping_result" | grep -oP '\d+(?=% packet loss)')

    # Check if packet loss is greater than the threshold
    if [ -n "$packet_loss" ] && [ "$packet_loss" -gt "$threshold" ]; then
        # Notify about high packet loss
        echo "High packet loss detected for $ip_address: $packet_loss%"
	echo " Office JIO ISP is currently experiencing a status downgrade $ip_address: $packet_loss%"| mail -s "JIO ISP STATUS NOTIFICATION" gokulnath.b@golden-hippo.com #rajesh.r@golden-hippo.com 
        # You can replace the echo statement with your preferred notification method
    else
	echo "Packet loss within acceptable limits for $ip_address: $packet_loss%"
       # echo "Packet loss within acceptable limits for $ip_address: $packet_loss%"| mail -s "JIO ISP STATUS NOTIFICATION" gokulnath.b@golden-hippo.com
    fi
}

# Specify the IP address to ping
ip_to_ping="115.247.219.141"  # Replace with your desired IP address

# Call the function
check_packet_loss "$ip_to_ping"

