#!/bin/sh
#
####################################
#
# Created by : Mohana kumar Manivannan
# Date : 26-05-2017
# Description : to run the use case two user outbytes Exfilteration
#
####################################
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
#export METASTORE_PORT=9084


dvar=$(date -d "-8 days"  +%Y%m%d)
dvar1=$(date -d "-7 days"  +%Y-%m-%d)
cdate=$(date -d "0 days"  +%Y-%m-%d)
evtdate=$(date -d "-1 days"  +%Y-%m-%d)
 
echo "creating populating user above threshold out bytes table............."

hive -hiveconf NEWDATE=$dvar NEWDATE1=$dvar1 CURRENTDATE=$cdate -f /home/hduser/hive_scripts/usecasetwo_useroutbytes.hql

edho "Done creating user above threshold list for the date"$cdate

hive -e -hiveconf "select concat(a.attacker_username,',',a.eventdate) from (select distinct attacker_username,eventdate from usecase_twodb.user_outbytes_above_threshold where eventdate = "$evtdate") a;" > /home/hduser/proxy_user_details.csv

echo "calling readuser.sh  to get the log files for the listed users" 
. /home/hduser/projectshell/readusers.sh
echo "done extracting Proxy logs for the above users..."
