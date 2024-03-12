#!/bin/bash

# Check if the IP address is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <115.247.219.142>"
    exit 1
fi

# Set the IP address from the command line argument
ip_address="115.247.219.142"

# Number of packets to send in the ping
num_packets=10

# Perform the ping
ping_result=$(ping -c $num_packets $ip_address)

# Extract packet loss percentage from the ping result
packet_loss=$(echo "$ping_result" | grep -oP '\d+(?=% packet loss)')

# Check if packet loss is present
if  (-z "$packet_loss")  then 

    echo "Error: Unable to determine packet loss. Check the IP address."

else
	
    # Display the packet loss status
    echo "Packet Loss Status for $ip_address:"
    echo "  Packet Loss: $packet_loss%"
fi

