
#!/bin/sh   
#get today's snappy files

files=$(ls /datadump/eventlogs/new/ |grep .COMPLETED |awk '{print $NF}')

#Only process if today's file(s) available...

if [ $? -eq 0 ]
then
counter=0
    for file in $files
    do    
        echo "Processing file: $file ..." 

        #run hadoop job
        
	newfile=$(echo $file | rev | cut -d"." -f2-  | rev)

        mv /datadump/eventlogs/new/$file /datadump/eventlogs/new/$newfile

        counter=$(($counter + 1))
    done
fi

echo "Total processed file(s): $counter"
echo "Done processing today's file(s)..."

