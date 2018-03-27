#!/bin/sh

#############
# Created by: Mohan kumar Manivannan
# Date: 20-30-2017
# update: 1. 04-May-2017(added DeleteHDFSCompLogs.sh to delete compressed log that older than 90 days) by Mohan
# Description: Delets Security logs older than 4 days from Local Datapool and HDFS(only uncompressed)
###########################

echo "deleting Local Logs Older than 4 days.........."
. projectshell/DeleteLocalLogs.sh
echo "Deleted."
echo "deleting HDFS(uncompressed) Logs Older than 4 days.........."
. projectshell/DeleteHDFSLogs.sh
echo "Deleted."
echo "deleting HDFS(compressed) Logs Older than 90 days.........."
. projectshell/DeleteHDFSCompLogs.sh
echo "Deleted."
