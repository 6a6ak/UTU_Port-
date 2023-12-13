#!/bin/bash

# Prompt the user to enter the port number
read -p "Enter the port number you want to open: " port

# Open the specified port using iptables
sudo iptables -A INPUT -p tcp --dport $port -j ACCEPT

# Save the iptables rules (optional, uncomment if needed)
# sudo iptables-save

echo "Port $port has been opened."
