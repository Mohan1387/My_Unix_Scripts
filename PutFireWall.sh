#!/bin/sh

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

export SPARK_EXAMPLES_JAR=/usr/local/spark/examples/jars/spark-examples_2.11-2.1.0.jar
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$HOME/bin:/usr/local/spark/bin
export PATH=$PATH:/usr/lib/scala/bin

export KAFKA_HOME=/usr/local/kafka
export PATH=$PATH:$KAFKA_HOME/bin

export MAVEN_HOME=/home/hduser/setups/maven
export PATH=$PATH:$MAVEN_HOME/bin

export PATH=$PATH:/home/hduser/setups/sbt/bin


/usr/local/hadoop/bin/hadoop fs -mkdir /user/hdfs/DuIps/uncompressed/$(date -d "0 days" +%Y%m%d)
echo "Loading the Firewall IP's logs from local to HDFS............"
/usr/local/hadoop/bin/hadoop fs -put /datadump/DuIPs/$(date -d "0 days" +%d%m%Y)/* /user/hdfs/DuIps/uncompressed/$(date -d "0 days" +%Y%m%d)
echo "Firewall IP's logs Successfully Moved to HDFS."
echo "compression process stared...."
/usr/local/pig/bin/pig -param FILE='/user/hdfs/DuIps/uncompressed/'$(date -d "0 days" +%Y%m%d)'/*' -param DATE='/user/hdfs/DuIps/compressed/'$(date -d "0 days" +%Y%m%d) -param CURR=$(date -d "0 days" +%Y%m%d) -f /home/hduser/pig_scripts/firewall_add_date.pig
echo "compression process completed."

echo "Running spark submit to get unique ips........."
dvar=$(date -d "0 days"  +%Y%m%d)
/usr/local/spark/bin/spark-submit  --master yarn --executor-cores 3  --num-executors 8 --driver-memory 10g /home/hduser/pyspark_script/firewall_unique_iP_parser.py hdfs://master:54310/user/hdfs/DuIps/compressed/$dvar/*.snappy
echo "dumped the data in partition to the table masterlogdb.du_day_unique_ip"

