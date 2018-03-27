#!/bin/sh
#########################3
#Created by: Mohan kumar M
#Date:14/03/2017
#Description: Sqoop HPSMTickets_AnalyticsData every 15 mins to Hive Table masterlogdb.HPSMTickets_AnalyticsData
#
#
#######################

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

export FLUME_HOME=/usr/local/flume/
export PATH=$PATH:$FLUME_HOME/bin/

export PIG_HOME=/usr/local/pig
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_CONF_DIR

export SQOOP_HOME=/usr/lib/sqoop
export PATH=$PATH:$SQOOP_HOME/bin

lastupdatedvalue=`hive -e 'select max(sr_no) from masterlogdb.hpsmtickets_analyticsdata;'`
#echo $lastupdatedvalue
sqoop import --connect "jdbc:sqlserver://172.16.254.130;database=SecurityDashboard" \
--username analyticsusr \
--password smc#12345 \
--driver com.microsoft.sqlserver.jdbc.SQLServerDriver \
--query "select * from dbo.HPSMTickets_AnalyticsData where sr_no > $lastupdatedvalue and \$CONDITIONS" \
--hive-drop-import-delims \
--hive-import \
--hive-table masterlogdb.HPSMTickets_AnalyticsData \
--target-dir hpsmtickets_analyticsdata \
-m 1
