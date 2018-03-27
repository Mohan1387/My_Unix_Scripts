#!/bin/sh

#get current files

files=$(ls /datadump/eventlogs/eventlog.csv.*| wc -l)

if [ $files -gt 0 ]

then

mv /datadump/eventlogs/eventlog.csv.* /datadump/eventlogs/new

fi

echo "file transfer process completed"

f2=$(ls /datadump/eventlogs/new/*.COMPLETED| wc -l)

if [ $files -gt 0 ]

then

mv /datadump/eventlogs/new/*.COMPLETED /datadump/eventlogs/processed

fi

echo "completed files moved"
