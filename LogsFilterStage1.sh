#!/bin/sh
#########################3
#Created by: Mohan kumar M
#Date:18/03/2017
#Description: Run the the stage1 MapReduce for Proxy & Exchange
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

dvar=$(date -d "-1 days"  +%Y%m%d)

#Proxy Stage 1 process
var1=$(hadoop fs -ls /user/hdfs/Proxy/compressed/$dvar | wc -l)

if [ $var1 -gt 0 ]
then
echo "Processing ....... "$dvar" Proxy Logs"
/usr/local/hadoop/bin/hadoop jar /home/hduser/mapred/ProxyLogFilter.jar ProxyLogFilter /user/hdfs/Proxy/compressed/$dvar/* /user/hdfs/Proxy/stage1/$dvar
echo $dvar" Proxy stage1 Mapreduce process completed."
else
echo "No New File to Process.."
fi

#Exchange Stage 1 process
var4=$(hadoop fs -ls /user/hdfs/Exchange/compressed/$dvar | wc -l)

if [ $var4 -gt 0 ]
then
echo "Processing ....... "$dvar" Exchange Logs"
/usr/local/hadoop/bin/hadoop jar /home/hduser/mapred/ExchangeLogFilter.jar ExchangeLogFilter /user/hdfs/Exchange/compressed/$dvar/* /user/hdfs/Exchange/stage1/$dvar
echo $dvar" Exchange stage1 Mapreduce process completed."
else
echo "No New File to Process.."
fi

#DHCP Stage1 process
var2=$(hadoop fs -ls /user/hdfs/DHCP/compressed/$dvar | wc -l)

if [ $var2 -gt 0 ]
then
echo "Processing ....... "$dvar" DHCP Logs"
/usr/local/hadoop/bin/hadoop jar /home/hduser/mapred/DHCPLogFilter.jar DHCPLogFilter /user/hdfs/DHCP/compressed/$dvar/* /user/hdfs/DHCP/stage1/$dvar
echo $dvar" DHCP stage1 Mapreduce process completed."
else
echo "No New File to Process.."
fi

#Active Dir Log Process
var3=$(hadoop fs -ls /user/hdfs/ActiveDir/compressed/$dvar | wc -l)

if [ $var3 -gt 0 ]
then
echo "Processing ....... "$dvar" Active Dir Logs"
/usr/local/hadoop/bin/hadoop jar /home/hduser/mapred/ActiveDirFilter.jar ActiveDirFilter /user/hdfs/ActiveDir/compressed/$dvar/* /user/hdfs/ActiveDir/stage1/$dvar
echo $dvar" Active Dir stage1 Mapreduce process completed."
else
echo "No New File to Process.."
fi

#Partition Creation for the above log tables is hive
varcheck=$(hadoop fs -ls /user/hdfs/Proxy/stage1/$dvar | wc -l)
if [ $varcheck -gt 0 ]
then
echo "Creating Partition for Activedir, Proxy and DHCP tables in masterlogdb database................ "
/usr/local/hive/bin/hive -hiveconf NEWDATE=$dvar -f /home/hduser/hive_scripts/haddpartition.hql
echo "partition creation process completed."
fi

#Send report to Hadoop Admin
echo "sending log report.... "
repDate=$(date -d "0 days"  +%Y-%m-%d)
. projectshell/tempshell/testreport.sh | mailx -v -s "Log Report ."$repDate" " -r "<sochadoop@du.ae>"  mohankumar.manivannan@du.ae,Manickasundaram.Murugappan@du.ae
echo "Log report Sent........"
