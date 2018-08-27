#!/bin/sh
#########################3
#Created by: Mohan kumar M
#Date:09th August 2018
#Description: Log watcher Script is used to monitor the incoming logs every 1 hour and raises an alert mail when stopped receving any logs
#
#######################

currDate=$(date -d "0 days"  +%d-%m-%Y-%r)
#Get Present Memory Bytes for all the Log and assing it ot a variable
proxy_bytes=$(du -s /datadump/Proxy | awk '{print $1}')
#echo $proxy_bytes
exchange_bytes=$(du -s /datadump/Exchange | awk '{print $1}')
#echo $exchange_bytes
nac_bytes=$(du -s /datadump/Nac | awk '{print $1}')
#echo $nac_bytes
citrix_bytes=$(du -s /datadump/Citrix | awk '{print $1}')
#echo $citrix_bytes
owa_bytes=$(du -s /datadump/OWA | awk '{print $1}')
#echo $owa_bytes

#declare a array to dump the variable
declare -a bytesArray

bytesArray[0]=$proxy_bytes
bytesArray[1]=$exchange_bytes
bytesArray[2]=$nac_bytes
bytesArray[3]=$citrix_bytes
bytesArray[4]=$owa_bytes

#Read the file to get previously stored bytes value for all the logs
readfile=/home/hduser/projectshell/temp/log_bytes.csv

#declare an array and dump the value read form the file to the array
declare -a readArray

readArray=(`cat "$readfile"`)

#Iterate over both array simultaneously and compare each and the alert to the Admin if both the perviously stored value and present value are same.
#if both the values are same after the duration of 1 hour then it denotes we are not receving logs.
#for i in "${readArray[@]}"
for i in {1..5}
do
#echo ${bytesArray[i-1]}"---"${readArray[i-1]}
if [[ ${bytesArray[i-1]} != ${readArray[i-1]} ]];
then

 if [ $i == 1 ];
 then
 echo "not same so receving PROXY log..."
 elif [ $i == 2 ];
 then
 echo "not same so receving EXCHANGE log..."
 elif [ $i == 3 ];
 then
 echo "not same so receving NAC log..."
 elif [ $i == 4 ];
 then
 echo "not same so receving CITRIX log..."
 elif [ $i == 5 ];
 then
 echo "not same so receving OWA log..."
 fi

else

 if [ $i == 1 ];
 then
 (echo "same so not receving PROXY log...")| mailx -v -s "Not receving Log Alert."$currDate" " -r "<sochadoop@du.ae>"  vannan@mail.com,appan@mail.com
 elif [ $i == 2 ];
 then
 (echo "same so not receving EXCHANGE log...") | mailx -v -s "Not receving Log Alert."$currDate" " -r "<sochadoop@du.ae>"  vannan@mail.com,appan@mail.com
 elif [ $i == 3 ];
 then
 (echo "same so not receving NAC log...") | mailx -v -s "Not receving Log Alert."$currDate" " -r "<sochadoop@du.ae>" vannan@mail.com,appan@mail.com
 elif [ $i == 4 ];
 then
 (echo "same so not receving CITRIX log...") | mailx -v -s "Not receving Log Alert."$currDate" " -r "<sochadoop@du.ae>"  vannan@mail.com,appan@mail.com
 elif [ $i == 5 ];
 then
 (echo "same so not receving OWA log...") | mailx -v -s "Not receving Log Alert."$currDate" " -r "<sochadoop@du.ae>"  vannan@mail.com,appan@mail.com
 fi

fi
done

#Save the Present bytes value to the file
printf "%s\n" "${bytesArray[@]}" > /home/hduser/projectshell/temp/log_bytes.csv
