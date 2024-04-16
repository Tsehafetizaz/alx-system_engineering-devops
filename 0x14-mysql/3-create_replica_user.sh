#!/usr/bin/env bash
# This script creates a user for replication purposes

mysql -u root -p <<EOF
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
EOF
