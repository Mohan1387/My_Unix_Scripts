filename=/home/hduser/proxy_targert.csv

declare -a myArray

#mkdir /home/hduser/Datapool/Proxy_Target

myArray=(`cat "$filename"`)
countofnames=(`cat "$filename" | wc -l`)

for i in "${myArray[@]}"
do

splitter=$(echo $i)

splitname=$(echo $splitter | awk -F, '{print $1}')

splitdate=$(echo $splitter | awk -F, '{print $2}')

username=$splitname

writefilename=$(echo $username | awk -F. '{print $1}')

writefilename=$(echo $username | sed 's/[\.]/_/g')
writefiledate=$(echo $splitdate | sed 's/[\-]//g')

echo " Creating log files........ "$username
#echo $writefilename
echo "for the date  "$splitdate

hive -e "set hive.cli.print.header=true; select substr(end_time,1,2) as hour,* from masterlogdb.proxy where dir='$writefiledate' and target_address='$username' and substr(end_date,1,10)='$splitdate';" > /home/hduser/Datapool/Proxy_Target/$writefilename"_"$writefiledate"_Proxy".tsv

echo " Done Creating log files for "$username" for the Date :  "$splitdate

done
