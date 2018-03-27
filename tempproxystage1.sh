#!/bin/sh

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

hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170117/* /user/hdfs/Proxy/stage1/20170117
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170118/* /user/hdfs/Proxy/stage1/20170118
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170119/* /user/hdfs/Proxy/stage1/20170119
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170120/* /user/hdfs/Proxy/stage1/20170120
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170121/* /user/hdfs/Proxy/stage1/20170121
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170122/* /user/hdfs/Proxy/stage1/20170122
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170123/* /user/hdfs/Proxy/stage1/20170123
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170124/* /user/hdfs/Proxy/stage1/20170124
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170125/* /user/hdfs/Proxy/stage1/20170125
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170126/* /user/hdfs/Proxy/stage1/20170126
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170127/* /user/hdfs/Proxy/stage1/20170127
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170128/* /user/hdfs/Proxy/stage1/20170128
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170129/* /user/hdfs/Proxy/stage1/20170129
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170130/* /user/hdfs/Proxy/stage1/20170130
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170131/* /user/hdfs/Proxy/stage1/20170131
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170201/* /user/hdfs/Proxy/stage1/20170201
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170202/* /user/hdfs/Proxy/stage1/20170202
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170203/* /user/hdfs/Proxy/stage1/20170203
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170204/* /user/hdfs/Proxy/stage1/20170204
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170205/* /user/hdfs/Proxy/stage1/20170205
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170206/* /user/hdfs/Proxy/stage1/20170206
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170207/* /user/hdfs/Proxy/stage1/20170207
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170208/* /user/hdfs/Proxy/stage1/20170208
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170209/* /user/hdfs/Proxy/stage1/20170209
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170210/* /user/hdfs/Proxy/stage1/20170210
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170211/* /user/hdfs/Proxy/stage1/20170211
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170212/* /user/hdfs/Proxy/stage1/20170212
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170213/* /user/hdfs/Proxy/stage1/20170213
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170214/* /user/hdfs/Proxy/stage1/20170214
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170215/* /user/hdfs/Proxy/stage1/20170215
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170216/* /user/hdfs/Proxy/stage1/20170216
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170217/* /user/hdfs/Proxy/stage1/20170217
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170218/* /user/hdfs/Proxy/stage1/20170218
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170219/* /user/hdfs/Proxy/stage1/20170219
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170220/* /user/hdfs/Proxy/stage1/20170220
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170221/* /user/hdfs/Proxy/stage1/20170221
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170222/* /user/hdfs/Proxy/stage1/20170222
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170223/* /user/hdfs/Proxy/stage1/20170223
hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/20170224/* /user/hdfs/Proxy/stage1/20170224
