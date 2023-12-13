#!/bin/bash

# Function to open a port
open_port() {
    sudo iptables -A INPUT -p tcp --dport $1 -j ACCEPT
    if [ $? -eq 0 ]; then
        echo "Port $1 has been opened."
    else
        echo "Failed to open port $1."
    fi
    read -p "Press Enter to return to the main menu..."
}

# Function to close a port
close_port() {
    sudo iptables -D INPUT -p tcp --dport $1 -j ACCEPT
    if [ $? -eq 0 ]; then
        echo "Port $1 has been closed."
    else
        echo "Failed to close port $1."
    fi
    read -p "Press Enter to return to the main menu..."
}

# Function to list iptables rules for open ports
list_firewall_open_ports() {
    echo "List of iptables rules for open ports:"
    sudo iptables -L INPUT -v -n | grep 'ACCEPT' | grep 'dpt:'
    read -p "Press Enter to return to the main menu..."
}

# Main menu
while true; do
    echo "Do you want to open, close, list iptables rules for open ports, or exit?"
    select opt in "Open" "Close" "List" "Exit"; do
        case $opt in
            Open )
                read -p "Enter the port number to open: " port
                open_port $port
                break
                ;;
            Close )
                read -p "Enter the port number to close: " port
                close_port $port
                break
                ;;
            List )
                list_firewall_open_ports
                break
                ;;
            Exit )
                exit 0
                ;;
            * ) echo "Invalid option $REPLY"; break;;
        esac
    done
done
