#!/bin/bash

# Function to open a port
open_port() {
    sudo iptables -A INPUT -p tcp --dport $1 -j ACCEPT
    echo "Port $1 has been opened."
}

# Function to close a port
close_port() {
    sudo iptables -D INPUT -p tcp --dport $1 -j ACCEPT
    echo "Port $1 has been closed."
}

# Function to list open ports
list_ports() {
    echo "List of open ports:"
    sudo netstat -tuln
}

# Main script starts here
echo "Do you want to open, close, or list open ports?"
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
            list_ports
            break
            ;;
        Exit )
            break
            ;;
        * ) echo "Invalid option $REPLY";;
    esac
done

# Save the iptables rules (optional, uncomment if needed)
# sudo iptables-save
