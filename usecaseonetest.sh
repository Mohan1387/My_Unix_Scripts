Nodays=`hive -e 'select substr(datediff(to_date(startdate), to_date(enddate)),2,3) from masterlogdb.sep_dhcp_input_with_sedate limit 1;' -hiveconf mapred.job.priority=VERY_HIGH`

startdate=`hive -e 'select startdate from masterlogdb.sep_dhcp_input_with_sedate limit 1;' -hiveconf mapred.job.priority=VERY_HIGH`

#truncate -s 0 /home/hduser/dates_details.txt

dates=$startdate
max=$Nodays
#datearray=()
for (( i=0; i <= $max; ++i ))
do
    echo $(date -d "$startdate $i days" '+%Y-%m-%d') >> /home/hduser/dates_details.csv
#datearray[$i]=$(date -d "$startdate $i days" '+%Y-%m-%d')
done
#echo "${datearray[0]}"
#echo "${datearray[83]}"

hive -e 'TRUNCATE TABLE masterlogdb.datelookup;'

hive -e "LOAD DATA LOCAL INPATH '/home/hduser/dates_details.csv' INTO TABLE masterlogdb.datelookup;"

rm /home/hduser/dates_details.txt

