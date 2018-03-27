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

#get yesterdays's  AD log files

files=$(ls -lrth /datadump/DHCP | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}')

#Only process if yesterdays's file(s) available...

if [ $? -eq 0 ]
then
counter=0
    for file in $files
        do
        echo "Processing file: $file ..."

        if [[ $file != *.COMPLETED ]]
        then
        #put file in HDFS

        /usr/local/hadoop/bin/hadoop fs -put /datadump/DHCP/$file /user/hdfs/DHCP/uncompressed

        #Rename the Processed file
	fcount=$(/usr/local/hadoop/bin/hadoop fs -ls  /user/hdfs/DHCP/uncompressed/ | grep $(date -d "-1 days" +%Y%m%d) | wc -l)
        if [ $fcount -gt 0 ]
        then
        mv /datadump/DHCP/$file /datadump/DHCP/$file.COMPLETED
	fi
        counter=$(($counter + 1))
        fi

        done
fi

echo "Total processed file(s): $counter"
echo "Done processing today's file(s)..."

 #execute PIG Script will parameters

/usr/local/pig/bin/pig -param FILE='/user/hdfs/DHCP/uncompressed/eventlog.csv.'$(date -d "-1 days" +%Y%m%d)'*' -param DATE='/user/hdfs/DHCP/compressed/'$(date -d "-1 days" +%Y%m%d) -f /home/hduser/pig_scripts/FileCompress.pig

# get list of files to be compressed
filename=$(/usr/local/hadoop/bin/hadoop fs -ls /user/hdfs/DHCP/uncompressed | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}')
#get the files count
filecount=$(/usr/local/hadoop/bin/hadoop fs -ls /user/hdfs/DHCP/uncompressed | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)
#if file count greater than 0
        if [ $filecount -gt 0 ]
        then
                for nfile in $filename
                do
                #Rename the Compressed file to .COMPLETED
                 echo " $nfile Compressed"
                /usr/local/hadoop/bin/hadoop fs -mv $nfile $nfile.COMPLETED

                done
        fi
echo "Done Compressing  files..."

