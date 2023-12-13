#!/bin/bash

# Function to open a port
open_port() {
    sudo ufw allow $1
    if [ $? -eq 0 ]; then
        echo "Port $1 has been allowed in UFW."
    else
        echo "Failed to allow port $1 in UFW."
    fi
    read -p "Press Enter to return to the main menu..."
}

# Function to close a port
close_port() {
    sudo ufw deny $1
    if [ $? -eq 0 ]; then
        echo "Port $1 has been denied in UFW."
    else
        echo "Failed to deny port $1 in UFW."
    fi
    read -p "Press Enter to return to the main menu..."
}

# Function to list UFW status and rules
list_firewall_status() {
    echo "UFW Status and Rules:"
    sudo ufw status verbose
    read -p "Press Enter to return to the main menu..."
}

# Main menu
while true; do
    echo "Do you want to open, close, or list UFW status and rules, or exit?"
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
                list_firewall_status
                break
                ;;
            Exit )
                exit 0
                ;;
            * ) echo "Invalid option $REPLY"; break;;
        esac
    done
done