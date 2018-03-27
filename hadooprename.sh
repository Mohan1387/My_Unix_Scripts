filename=$(hadoop fs -ls $1 | awk '{print $NF}')

for file in $filename
do

newfile=$file

hadoop fs -mv $newfile $newfile.COMPLETED

done

echo "Done Renaming  files..."
