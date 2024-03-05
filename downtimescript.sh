#!/bin/bash

# Set the email configuration
recipient_email="gokulnath.b@golden-hippo.com"
subject_server_down="Server Down Notification"
subject_server_up="Server Up Notification"
mail_command="/usr/bin/mail"

# Set the server IP address
server_ip="192.168.1.156"
flag_file="server_status.flag"

# Function to send email notification
send_email_notification() {
    local subject="$1"
    local message="$2"
    echo "$message" | $mail_command -s "$subject" "$recipient_email"
}

# Check if the server is reachable
if ping -c 1 "$server_ip" > /dev/null 2>&1; then
    # Server is up
    if [ -f "$flag_file" ]; then
        # Server was down, send up notification
        send_email_notification "$subject_server_up" "The server is now up and running."
        rm "$flag_file"
    fi
else
    # Server is down
    if [ ! -f "$flag_file" ]; then
        # Server was up, send down notification
        send_email_notification "$subject_server_down" "The server is down. Please investigate."
        touch "$flag_file"
    fi
fi

