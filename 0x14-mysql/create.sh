#!/usr/bin/env bash
# This script creates a MySQL user and sets up permissions

# Login to MySQL and execute the SQL commands to create a user and grant permissions
mysql -uroot -proot <<MYSQL_SCRIPT
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Display the grants for the new user to ensure correct setup
mysql -uroot -proot -e "SHOW GRANTS FOR 'holberton_user'@'localhost'"
