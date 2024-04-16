#!/usr/bin/env bash
# This script creates a MySQL user named holberton_user with specific privileges

# Create the user and grant permissions
mysql -u root -p <<EOF
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
EOF
