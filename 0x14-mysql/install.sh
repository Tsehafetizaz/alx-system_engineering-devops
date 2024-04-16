#!/usr/bin/env bash
# This script installs MySQL version 5.7.x on Ubuntu 16.04

# Update package information, ensuring that APT works with the https method, and that CA certificates are installed
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates

# Add Oracle's repository for MySQL 5.7
wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb

# Update package information with the new repository
sudo apt-get update

# Install MySQL Server in a non-interactive mode. Default root password will be "root"
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.7

# Check MySQL version
mysql --version
