#!/usr/bin/env bash
# This script creates a replication user on the primary MySQL server

mysql -uroot -proot <<MYSQL_SCRIPT
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
