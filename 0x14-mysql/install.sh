#!/usr/bin/env bash
# Installs MySQL version 5.7 and ensures it is running
sudo apt-get update
sudo apt-get install mysql-server-5.7
sudo systemctl start mysql
sudo systemctl enable mysql
