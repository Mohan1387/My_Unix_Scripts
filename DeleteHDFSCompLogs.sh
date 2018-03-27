#!/bin/sh
###################
#
# Created by: Mohan Kumar Manivannan
# Date : 04/May/2017 
# Description : to delete logs that are older than 90 Days
# updated : 1. on 04-May-2017 (added stage1 90 daye older log delete logic) by Mohan.
# 	    2. on 04-May-2017 (added partiton deletion logic for hive tables activedir,proxy,dhcp by calling hql script(hiveDeletePartition.hql)) by Mohan.
#
####################
#hadoop fs -ls /user/hdfs/ActiveDir/compressed/ | awk '{print $NF}' | sed 's/\//\,/g' | awk -F, '{print $6}'

#Environment variables
export JAVA_HOME=/usr/java/jdk1.8.0_60
export PATH=$PATH:$JAVA_HOME/bin
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CLASSPATH=$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME

export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/
export PATH=$PATH:$HADOOP_CLASSPATH
export LD_LIBRARY_PATH=/usr/local/hadoop/lib/native/:$LD_LIBRARY_PATH

export HIVE_HOME=/usr/local/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
export HIVE_CLASS_PATH=$HIVE_CONF_DIR

export PATH=$PATH:$HIVE_HOME/bin
export CLASSPATH=$CLASSPATH:/usr/local/hadoop/lib/native
#export CLASSPATH=$CLASSPATH:/usr/local/hive/lib
export HIVE_AUX_JARS_PATH=/usr/local/hive/lib


fname1=$(hadoop fs -ls /user/hdfs/ActiveDir/compressed/ | awk '{print $NF}')
fname2=$(hadoop fs -ls /user/hdfs/Proxy/compressed/ | awk '{print $NF}')
fname3=$(hadoop fs -ls /user/hdfs/AntiVirus/compressed/ | awk '{print $NF}')
fname4=$(hadoop fs -ls /user/hdfs/Nac/compressed/ | awk '{print $NF}')
fname5=$(hadoop fs -ls /user/hdfs/DHCP/compressed/ | awk '{print $NF}')
fname6=$(hadoop fs -ls /user/hdfs/Exchange/compressed/ | awk '{print $NF}')
fname7=$(hadoop fs -ls /user/hdfs/Citrix/compressed/ | awk '{print $NF}')
fname8=$(hadoop fs -ls /user/hdfs/OWA/compressed/ | awk '{print $NF}')

cond=$(date -d "-10 days" +"%Y%m%d")

#Active Dir
echo "Deleting Active Dir compressed Files older than 90 Days......"
for i in $fname1
do

fnamenew1=$(echo "$i" | sed 's/\//\,/g')

new1=$(echo "$fnamenew1" | awk -F, '{print $6}')

if [ $(date -d "$new1" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Active Dir compressed Files older than 90 Days Deleted."

#Proxy
echo "Deleting Proxy  compressed Files older than 90 Days......"
for i in $fname2
do

fnamenew2=$(echo "$i" | sed 's/\//\,/g')

new2=$(echo "$fnamenew2" | awk -F, '{print $6}')

if [ $(date -d "$new2" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Proxy compressed Files older than 90 Days Deleted."

#AntiVirus
echo "Deleting Anti Virus  compressed Files older than 90 Days......"
for i in $fname3
do

fnamenew3=$(echo "$i" | sed 's/\//\,/g')

new3=$(echo "$fnamenew3" | awk -F, '{print $6}')

if [ $(date -d "$new3" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Anti Virus  compressed Files older than 90 Days Deleted."

#Nac
echo "Deleting Nac compressed Files older than 90 Days......"
for i in $fname4
do

fnamenew4=$(echo "$i" | sed 's/\//\,/g')

new4=$(echo "$fnamenew4" | awk -F, '{print $6}')

if [ $(date -d "$new4" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Nac compressed Files older than 90 Days Deleted."

#DHCP
echo "Deleting DHCP compressed Files older than 90 Days......"
for i in $fname5
do

fnamenew5=$(echo "$i" | sed 's/\//\,/g')

new5=$(echo "$fnamenew5" | awk -F, '{print $6}')

if [ $(date -d "$new5" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "DHCP compressed Files older than 10 Days Deleted."

#Exchange
echo "Deleting Exchange compressed Files older than 10 Days......"

for i in $fname6
do

fnamenew6=$(echo "$i" | sed 's/\//\,/g')

new6=$(echo "$fnamenew6" | awk -F, '{print $6}')

if [ $(date -d "$new6" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "Exchange compressed Files older than 10 Days Deleted."

#Citrix
echo "Deleting Citrix compressed Files older than 10 Days......"

for i in $fname7
do

fnamenew7=$(echo "$i" | sed 's/\//\,/g')

new7=$(echo "$fnamenew7" | awk -F, '{print $6}')

if [ $(date -d "$new7" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "Citrix compressed Files older than 10 Days Deleted."

#OWA
echo "Deleting OWA compressed Files older than 10 Days......"

for i in $fname8
do

fnamenew8=$(echo "$i" | sed 's/\//\,/g')

new8=$(echo "$fnamenew8" | awk -F, '{print $6}')

if [ $(date -d "$new8" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "OWA compressed Files older than 10 Days Deleted."
#upda 1 start
#------------------------------ deleting Stage 1 log files----------------------------

fnamestg1=$(hadoop fs -ls /user/hdfs/ActiveDir/stage1/ | awk '{print $NF}')
fnamestg2=$(hadoop fs -ls /user/hdfs/Proxy/stage1/ | awk '{print $NF}')
#fnamestg3=$(hadoop fs -ls /user/hdfs/AntiVirus/stage1/ | awk '{print $NF}')
#fnamestg4=$(hadoop fs -ls /user/hdfs/Nac/stage1/ | awk '{print $NF}')
fnamestg5=$(hadoop fs -ls /user/hdfs/DHCP/stage1/ | awk '{print $NF}')
fnamestg6=$(hadoop fs -ls /user/hdfs/Exchange/stage1/ | awk '{print $NF}')

cond=$(date -d "-90 days" +"%Y%m%d")

#Active Dir
echo "Deleting Active Dir stage1 Files older than 90 Days......"
for i in $fnamestg1
do

fnamenew1=$(echo "$i" | sed 's/\//\,/g')

new1=$(echo "$fnamenew1" | awk -F, '{print $6}')

if [ $(date -d "$new1" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Active Dir stage1 Files older than 90 Days Deleted."

#Proxy
echo "Deleting Proxy  Stage1 Files older than 90 Days......"
for i in $fnamestg2
do

fnamenew2=$(echo "$i" | sed 's/\//\,/g')

new2=$(echo "$fnamenew2" | awk -F, '{print $6}')

if [ $(date -d "$new2" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Proxy stage1 Files older than 90 Days Deleted."

#AntiVirus
#echo "Deleting Anti Virus  stage1 Files older than 90 Days......"
#for i in $fnamestg3
#do
#
#fnamenew3=$(echo "$i" | sed 's/\//\,/g')
#
#new3=$(echo "$fnamenew3" | awk -F, '{print $6}')
#
#if [ $(date -d "$new3" +"%Y%m%d") -lt $cond ]
#then
#echo $(date -d "$new1" +"%Y%m%d")
#/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
#fi
#done
#echo "Anti Virus stage1 Files older than 90 Days Deleted."

#Nac
#echo "Deleting Nac stage1 Files older than 90 Days......"
#for i in $fnamestg4
#do
#
#fnamenew4=$(echo "$i" | sed 's/\//\,/g')
#
#new4=$(echo "$fnamenew4" | awk -F, '{print $6}')
#
#if [ $(date -d "$new4" +"%Y%m%d") -lt $cond ]
#then
#echo $(date -d "$new1" +"%Y%m%d")
#/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
#fi
#done
#echo "Nac Stage1 Files older than 90 Days Deleted."

#DHCP
echo "Deleting DHCP stage1 Files older than 90 Days......"
for i in $fnamestg5
do

fnamenew5=$(echo "$i" | sed 's/\//\,/g')

new5=$(echo "$fnamenew5" | awk -F, '{print $6}')

if [ $(date -d "$new5" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "DHCP stage1 Files older than 90 Days Deleted."

#Exchange
echo "Deleting Exchange Stage1 Files older than 90 Days......"
for i in $fnamestg6
do

fnamenew6=$(echo "$i" | sed 's/\//\,/g')

new6=$(echo "$fnamenew6" | awk -F, '{print $6}')

if [ $(date -d "$new6" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "Exchange stage1 Files older than 90 Days Deleted."

#update 1 end

#update 2
#Deleting Partition for AD,Proxy,DHCP tables is hive

dvar=$(date -d "-91 days"  +%Y%m%d)
eventdvar=$(date -d "-91 days"  +%Y-%m-%d)

varcheck=$(hadoop fs -ls /user/hdfs/ActiveDir/stage1/$dvar | wc -l)

if [ $varcheck -eq 0 ]
then
echo "Deleting Partition for Activedir, Proxy and DHCP tables in masterlogdb database................ "

/usr/local/hive/bin/hive -hiveconf NEWDATE=$dvar NEWEDATE=$eventdvar -f /home/hduser/hive_scripts/hiveDeletePartition.hql

/usr/local/hive/bin/hive -hiveconf NEWEDATE=$eventdvar -f /home/hduser/hive_scripts/hiveDeletePartition_usecasetwo.hql
echo "partitions Deletion process completed."
fi

