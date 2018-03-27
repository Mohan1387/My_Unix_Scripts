
filename=$(hadoop fs -ls /user/hdfs/ActiveDir/uncompressed | grep $(date -d "-2 days"  +%Y%m%d) | awk '{print $NF}')

filecount=$(hadoop fs -ls /user/hdfs/ActiveDir/uncompressed | grep $(date -d "-2 days"  +%Y%m%d) | wc -l)

if [ $filecount -gt 0 ]
then
for nfile in $filename
do
#execute PIG Script will parameters
echo "compressing file: $nfile ..."
pig -param FILE=$nfile -param DATE='/user/hdfs/ActiveDir/'$(date -d "-2 days" +%Y%m%d) -f /home/hduser/pig_scripts/ActiveDirComp.pig

#Rename the Compressed file to .COMPLETED
echo " $nfile Compressed"
hadoop fs -mv $nfile $nfile.COMPLETED
done
fi
echo "Done Compressing  files..."

