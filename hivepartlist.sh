listofPart=`hive -e 'show partitions masterlogdb.proxy;' -hiveconf mapred.job.priority=VERY_HIGH`

listofPartDate = ${listofPart:4:8}

startdate=$listofPartDate

enddate=$(date -d "-90 days" '+%Y%m%d')

datearray=()
d=
n=0
until [ "$d" = "$enddate" ]
do  
    d=$(date -d "$startdate + $n days" +%Y%m%d)
    echo $d
    ((n++))
    datearray[$n]=$d 
    echo "in array ""${datearray[$n]}"
/usr/local/hive/bin/hive -hiveconf NEWDATE=$d -f /home/hduser/hive_scripts/hiveDeletePartition.hql
done

