#!/usr/bin/env bash
# This script backs up all MySQL databases into a compressed file

# Validate input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <MySQL Root Password>"
    exit 1
fi

PASSWORD=$1
DATE=$(date +%d-%m-%Y)
BACKUP_FILE="backup.sql"
ARCHIVE_FILE="$DATE.tar.gz"

# Perform MySQL dump
mysqldump -uroot -p"$PASSWORD" --all-databases > $BACKUP_FILE

# Compress the backup
tar -czf $ARCHIVE_FILE $BACKUP_FILE

# Clean up
rm $BACKUP_FILE

# List the final archive file
ls -lh $ARCHIVE_FILE
