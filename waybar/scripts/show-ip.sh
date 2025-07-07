#!/bin/bash

# Define gold color
COLOR="#F0C674"

# Get active network interface
interface=$(ip route | awk '/default/ {print $5}' | head -n 1)

# Get IPv4 address
ipv4=$(ip -4 addr show "$interface" | awk '/inet / {print $2}' | cut -d/ -f1)

# Output with icon and color
if [[ -z "$ipv4" ]]; then
    echo "<span foreground='$COLOR'>󰖪</span> No IP"
else
    if [[ "$interface" =~ ^e ]]; then
        echo "<span foreground='$COLOR'>󰈀</span> $ipv4"  # Ethernet icon
    else
        echo "<span foreground='$COLOR'></span> $ipv4"  # Wi-Fi icon
    fi
fi
