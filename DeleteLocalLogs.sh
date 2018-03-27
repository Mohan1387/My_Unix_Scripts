#!/bin/sh

# Delete files Older than 5 Days

find /datadump/eventlogs/processed -mtime +5 -type f -delete

# Delete files older than 4 days 

echo "Deleting Active Directory log file older than 4 days"

find /datadump/ActiveDir -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting Anti Virus log file older than 4 days"

find /datadump/AntiVirus -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting Proxy log file older than 4 days"

find /datadump/Proxy -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting Exchange log file older than 4 days"

find /datadump/Exchange -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting DHCP log file older than 4 days"

find /datadump/DHCP -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting Nac log file older than 4 days"

find /datadump/Nac -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting Citrix log file older than 4 days"

find /datadump/Citrix -mtime +3 -type f -delete

echo "Deleted"

echo "Deleting OWA log file older than 4 days"

find /datadump/OWA -mtime +3 -type f -delete

echo "Deleted"
