# Cleanup
# Run as root

cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "log cleaned up."
