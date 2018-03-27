for i in {1..90}
do

dvar=$(date -d "-$i days"  +%Y%m%d)

varcheck=$(hadoop fs -ls /user/hdfs/ActiveDir/stage1/$dvar | wc -l)

/usr/local/hive/bin/hive -hiveconf NEWDATE=$dvar -f /home/hduser/hive_scripts/haddpartition.hql

done 
