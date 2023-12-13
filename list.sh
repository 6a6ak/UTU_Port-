#!/bin/bash

# Function to list iptables rules for open ports
list_firewall_open_ports() {
    echo "List of iptables rules for open ports:"
    sudo iptables -L INPUT -v -n | grep 'ACCEPT' | grep 'dpt:'
    read -p "Press Enter to return to the main menu..."
}

# Main menu
while true; do
    echo "Do you want to list iptables rules for open ports, or exit?"
    select opt in "List" "Exit"; do
        case $opt in
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
