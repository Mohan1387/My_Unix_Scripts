#!/bin/sh
###################
#
# Created by: Mohan Kumar Manivannan
# Date : 21/March/2017
# Description : to delete uncompressed logs that are older than 4 Days
#
####################

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
export HIVE_CONF_DIR=$HIVE_HOME/etc/hadoop
export HIVE_CLASS_PATH=$HIVE_CONF_DIR

export PATH=$PATH:$HIVE_HOME/bin
export CLASSPATH=$CLASSPATH:/usr/local/hadoop/lib/native
#export CLASSPATH=$CLASSPATH:/usr/local/hive/lib/*:.

export FLUME_HOME=/usr/local/flume/
export PATH=$PATH:$FLUME_HOME/bin/

export PIG_HOME=/usr/local/pig
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_CONF_DIR


fname1=$(hadoop fs -ls /user/hdfs/ActiveDir/uncompressed/* | awk '{print $NF}')
fname2=$(hadoop fs -ls /user/hdfs/Proxy/uncompressed/* | awk '{print $NF}')
fname3=$(hadoop fs -ls /user/hdfs/AntiVirus/uncompressed/* | awk '{print $NF}')
fname4=$(hadoop fs -ls /user/hdfs/Nac/uncompressed/* | awk '{print $NF}')
fname5=$(hadoop fs -ls /user/hdfs/DHCP/uncompressed/* | awk '{print $NF}')
fname6=$(hadoop fs -ls /user/hdfs/Exchange/uncompressed/* | awk '{print $NF}')
fname7=$(hadoop fs -ls /user/hdfs/Citrix/uncompressed/* | awk '{print $NF}')
fname8=$(hadoop fs -ls /user/hdfs/OWA/uncompressed/* | awk '{print $NF}')

cond=$(date -d "-4 days" +"%Y%m%d")

#Active Dir
echo "Deleting Active Dir uncompressed Files older than 4 Days......"
for i in $fname1
do 

fnamenew1=$(echo "$i" | sed 's/\./\,/g')   

new1=$(echo "$fnamenew1" | awk -F, '{print $3}')

new1=${new1:0:8}

if [ $(date -d "$new1" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i 
#echo $i
fi
done
echo "Active Dir uncompressed Files older than 4 Days Deleted."

#Proxy
echo "Deleting Proxy  uncompressed Files older than 4 Days......"
for i in $fname2
do

fnamenew2=$(echo "$i" | sed 's/\./\,/g')

new2=$(echo "$fnamenew2" | awk -F, '{print $3}')

new2=${new2:0:8}

if [ $(date -d "$new2" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Proxy uncompressed Files older than 4 Days Deleted."

#AntiVirus
echo "Deleting Anti Virus  uncompressed Files older than 4 Days......"
for i in $fname3
do

fnamenew3=$(echo "$i" | sed 's/\./\,/g')

new3=$(echo "$fnamenew3" | awk -F, '{print $3}')

new3=${new3:0:8}

if [ $(date -d "$new3" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Anti Virus  uncompressed Files older than 4 Days Deleted."

#Nac
echo "Deleting Nac uncompressed Files older than 4 Days......"
for i in $fname4
do

fnamenew4=$(echo "$i" | sed 's/\./\,/g')

new4=$(echo "$fnamenew4" | awk -F, '{print $3}')

new4=${new4:0:8}

if [ $(date -d "$new4" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "Nac uncompressed Files older than 4 Days Deleted."

#DHCP
echo "Deleting DHCP uncompressed Files older than 4 Days......"
for i in $fname5
do

fnamenew5=$(echo "$i" | sed 's/\./\,/g')

new5=$(echo "$fnamenew5" | awk -F, '{print $3}')

new5=${new5:0:8}

if [ $(date -d "$new5" +"%Y%m%d") -lt $cond ]
then
#echo $(date -d "$new1" +"%Y%m%d")
/usr/local/hadoop/bin/hadoop fs -rm -r $i
#echo $i
fi
done
echo "DHCP uncompressed Files older than 4 Days Deleted."

#exchange
echo "Deleting Exchange  uncompressed Files older than 4 Days......"
for i in $fname6
do

fnamenew6=$(echo "$i" | sed 's/\./\,/g')

new6=$(echo "$fnamenew6" | awk -F, '{print $3}')

new6=${new6:0:8}

if [ $(date -d "$new6" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "Exchange uncompressed Files older than 4 Days Deleted."

##citrix
echo "Deleting Citrix uncompressed Files older than 4 Days......"
for i in $fname7
do

fnamenew7=$(echo "$i" | sed 's/\./\,/g')

new7=$(echo "$fnamenew7" | awk -F, '{print $3}')

new7=${new7:0:8}

if [ $(date -d "$new7" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "Citrix uncompressed Files older than 4 Days Deleted."

#OWA
echo "Deleting OWA uncompressed Files older than 4 Days......"
for i in $fname8
do

fnamenew8=$(echo "$i" | sed 's/\./\,/g')

new8=$(echo "$fnamenew8" | awk -F, '{print $3}')

new8=${new8:0:8}

if [ $(date -d "$new8" +"%Y%m%d") -lt $cond ]
then

/usr/local/hadoop/bin/hadoop fs -rm -r $i

fi
done
echo "OWA uncompressed Files older than 4 Days Deleted."

