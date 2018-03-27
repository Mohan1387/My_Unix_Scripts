filename=/home/hduser/proxy_url_details.csv

declare -a myArray

myArray=(`cat "$filename"`)

countofnames=(`cat "$filename" | wc -l`)

for i in "${myArray[@]}"
do

splitter=$(echo $i)

splitname=$(echo $splitter | awk -F, '{print $1}')

splitdate=$(echo $splitter | awk -F, '{print $2}')

splittime=$(echo $splitter | awk -F, '{print $3}')

urlname=$splitname

writefilename=$(echo "$urlname" | sed 's/\./\_/g' | sed 's/\-/\_/g')

dateval=$(echo $splitdate | sed 's/[\-]//g')

timeval=$splittime

echo " Creating log files........ "$urlname
#echo $writefilename
echo "for the date  "$splitdate

hive -e "select * from masterlogdb.proxy where destination_host_name='$urlname' and dir='$dateval' and substr(end_time,1,2)='$timeval';" > Datapool/Exfilter/$writefilename"_"$dateval"_"$timeval"_Proxy".tsv

echo " Done Creating log files for "$urlname" for the Date :  "$splitdate

done
