#!/bin/sh
#########################3
#Created by: Mohan kumar M
#Date:11/02/2018
#Description: Run the stage1 process for Citrix log
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

export FLUME_HOME=/usr/local/flume/
export PATH=$PATH:$FLUME_HOME/bin/

export PIG_HOME=/usr/local/pig
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_CONF_DIR

export SQOOP_HOME=/usr/lib/sqoop
export PATH=$PATH:$SQOOP_HOME/bin

export OOZIE_VERSION=4.3.0
export OOZIE_HOME=/usr/local/oozie
export PATH=$PATH:$OOZIE_HOME/bin

export SPARK_EXAMPLES_JAR=/usr/local/spark/examples/jars/spark-examples_2.11-2.1.0.jar
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$HOME/bin:/usr/local/spark/bin
export PATH=$PATH:/usr/lib/scala/bin

export KAFKA_HOME=/usr/local/kafka
export PATH=$PATH:$KAFKA_HOME/bin

export MAVEN_HOME=/home/hduser/setups/maven
export PATH=$PATH:$MAVEN_HOME/bin

export PATH=$PATH:/home/hduser/setups/sbt/bin

dvar=$(date -d "-1 days"  +%Y%m%d)

/usr/local/spark/bin/spark-submit /home/hduser/pyspark_script/CitrixParser.py hdfs://master:54310/user/hdfs/Citrix/compressed/$dvar/*.snappy $dvar
