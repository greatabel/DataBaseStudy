#! /bin/bash

# Cleanup
# Run as root

LOG_DIR=/var/log
cd $LOG_DIR
cat /dev/null > messages
cat /dev/null > wtmp
echo "log cleaned up."
