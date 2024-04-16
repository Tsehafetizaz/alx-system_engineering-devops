#!/usr/bin/env bash
# This script creates a database and a table, then inserts a row

mysql -uroot -proot <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL);
INSERT INTO nexus6 (name) VALUES ('Leon');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
