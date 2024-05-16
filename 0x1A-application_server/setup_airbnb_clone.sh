#!/usr/bin/env bash
# This script sets up the development environment for the AirBnB clone v2 web framework

# Install net-tools package
sudo apt-get update
sudo apt-get install -y net-tools

# Clone the AirBnB_clone_v2 repository
git clone https://github.com/yourusername/AirBnB_clone_v2.git /home/ubuntu/AirBnB_clone_v2

# Navigate to the project directory
cd /home/ubuntu/AirBnB_clone_v2

# Run the Flask application
python3 -m web_flask.0-hello_route
