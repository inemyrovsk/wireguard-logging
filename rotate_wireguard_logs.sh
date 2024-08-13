#!/bin/bash

# Define the log directory
LOG_DIR="/var/log/wireguard"

# Define the backup directory
BACKUP_DIR="$LOG_DIR/backup"

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Get the current date in YYYY-MM-DD format
CURRENT_DATE=$(date +"%Y-%m-%d")

# Archive the current logs, excluding the backup directory
tar -czf $BACKUP_DIR/wireguard_logs_$CURRENT_DATE.tar.gz --exclude=$BACKUP_DIR $LOG_DIR/*

# Delete logs older than 7 days
find $BACKUP_DIR -type f -name "wireguard_logs_*.tar.gz" -mtime +7 -exec rm {} \;
