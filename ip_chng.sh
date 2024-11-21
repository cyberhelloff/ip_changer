#!/bin/bash

# Function to change the IP address
change_ip() {
    # Send the NEWNYM signal to Tor to change the IP address
    echo "NEWNYM" | nc localhost 9051
}

# Function to get the current IP address
get_ip() {
    # Use curl to get the current IP address
    curl -s https://api.ipify.org
}

# Main loop
while true; do
    # Get the current IP address
    current_ip=$(get_ip)
    echo "Current IP: $current_ip"

    # Change the IP address
    change_ip

    # Sleep for a random time between 3 and 50 seconds
    sleep_time=$((RANDOM % 48 + 3))
    echo "Sleeping for $sleep_time seconds..."
    sleep $sleep_time
done

