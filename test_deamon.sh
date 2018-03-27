#!/bin/sh
#############################################
#	Created by : Mohan Kumar Manivannan
#	Date       : 17th May 2017
#	Description: Check the Hadoop Mapreduce and Yarn Demons and run the deamon if any of the deamons not running.
#
############################################
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

jpslist=$(jps | awk '{print $2","}')

set -f                      # avoid globbing (expansion of *).

declare -a checklist=('ResourceManager' 'JobHistoryServer' 'NameNode')

deamonarray=(${jpslist//,/ })


array_contains2 () { 
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

# check Resource manager
array_contains2 deamonarray "${checklist[0]}"  && i=1 || i=0

if [ $i == 1 ] 
then
	echo "${checklist[0]}""  services are runing..."
else
	echo "${checklist[0]}""  services are not runing restarting services...."
/usr/local/hadoop/sbin/start-yarn.sh	
fi

#check job history

array_contains2 deamonarray "${checklist[1]}"  && i=1 || i=0

if [ $i == 1 ] 
then
	echo "${checklist[1]}""  services are runing..."
else
	echo "${checklist[1]}""  services are not runing restarting services...."
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
fi

# check Node Manager

array_contains2 deamonarray "${checklist[2]}"  && i=1 || i=0

if [ $i == 1 ] 
then
	echo "${checklist[2]}""  services are runing..."
else
	echo "${checklist[2]}"" Name node DFS services are not running please take necessary action."
fi

#for i in "${!deamonarray[@]}"
#do
#    echo "${deamonarray[i]}"
#   
#done
#
#echo "${checklist[0]}"
