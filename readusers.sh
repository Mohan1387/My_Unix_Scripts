filename=/home/hduser/proxy_user_details.csv

declare -a myArray

folder=$(date -d "0 days"  +%Y%m%d)
mkdir /home/hduser/Datapool/Exfilter/$folder 

myArray=(`cat "$filename"`)
countofnames=(`cat "$filename" | wc -l`)

for i in "${myArray[@]}" 
do


splitter=$(echo $i)

splitname=$(echo $splitter | awk -F, '{print $1}')

splitdate=$(echo $splitter | awk -F, '{print $2}')

username=$splitname

writefilename=$(echo $username | awk -F. '{print $1}')

dateval=$(echo $splitdate | sed 's/[\-]//g')

echo " Creating log files........ "$username
#echo $writefilename
echo "for the date  "$splitdate

hive -e "select substr(end_time,1,2),* from masterlogdb.proxy where attacker_username='$username' and dir='$dateval';" > Datapool/Exfilter/$folder/$writefilename"_"$dateval"_Proxy".tsv

echo " Done Creating log files for "$username" for the Date :  "$splitdate

done
