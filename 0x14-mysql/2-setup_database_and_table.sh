#!/usr/bin/env bash
# This script creates a database and a table with at least one entry

# Login to MySQL and setup database and table
mysql -u root -p <<EOF
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (id INT AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY(id));
INSERT INTO nexus6 (name) VALUES ('Leon');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
EOF
