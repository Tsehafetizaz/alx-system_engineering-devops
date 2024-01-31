Description
Briefly describe your project, its goals, and what it aims to achieve. Mention the significance of the networking basics and how these scripts contribute to understanding or utilizing those concepts.

Getting Started
Dependencies
Bash shell (typically available on Linux and macOS systems)
nc (Netcat) for network connections
ip or ifconfig commands for network interface inspection (depending on the system)
telnet for testing network connections
Installing
Clone the repository to your local machine (provide the command for cloning your alx-system_engineering-devops repository).
Ensure the scripts are executable: chmod +x <script_name>
Executing Scripts
1. Display Active IPv4 IPs
File: 1-show_attached_IPs
Purpose: This script displays all active IPv4 addresses on the machine it's executed on, including the localhost IP address.
Usage: ./1-show_attached_IPs | cat -e
2. Listen on Port 98 on Localhost
File: 100-port_listening_on_localhost
Purpose: Sets up a simple server listening on port 98 on localhost, echoing back any received text.
Usage:
Start the listening server: sudo ./100-port_listening_on_localhost
In another terminal, connect and send text: telnet localhost 98
