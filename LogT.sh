#!/bin/sh

#DHCP Logs

filescount=$(ls -lrth /datadump/DHCP | grep $(date -d yesterday  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/DHCP | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files == *.COMPLETED ]]
then

echo "Calling Nac log Files Transfer Script"
. /home/hduser/projectshell/tempshell/testing.sh "calling"
echo "Nac log Files Transfered"

else

echo "No DHCP Log File To Process"

fi

#Nac Logs

filescount=$(ls -lrth /datadump/Nac | grep $(date -d yesterday  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/Nac | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files == *.COMPLETED ]]
then

echo "Calling Nac log Files Transfer Script"
. /home/hduser/projectshell/tempshell/testing.sh "calling"
echo "Nac log Files Transfered"

else

echo "No Nac Log File To Process"

fi
