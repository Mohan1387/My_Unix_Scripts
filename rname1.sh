
#!/bin/sh   
#get today's snappy files

files=$(ls $1 |grep eventlog.csv.2017* |awk '{print $NF}')

#Only process if today's file(s) available...

if [ $? -eq 0 ]
then
counter=0
    for file in $files
    do    
        echo "Processing file: $file ..." 

       mv $1$file $1$file.COMPLETED

        counter=$(($counter + 1))
    done
fi

echo "Total processed file(s): $counter"
echo "Done processing today's file(s)..."

