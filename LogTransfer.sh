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

# Active Directory Logs 

filescount=$(ls -lrth /datadump/ActiveDir | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/ActiveDir | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling Active Directory Files Transfer Script"
. /home/hduser/projectshell/PutActiveDirtoHDFS.sh
echo "Active Directory Files Transfered"

else

echo "No Active Directory Log File To Process"

fi

#Proxy Logs 

filescount=$(ls -lrth /datadump/Proxy | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/Proxy | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling Proxy Files Transfer Script"
. /home/hduser/projectshell/PutProxytoHDFS.sh
echo "Proxy Files Transfered"

else

echo "No Proxy Log File To Process"

fi

#Anti Virus Logs

filescount=$(ls -lrth /datadump/AntiVirus | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/AntiVirus | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling AntiVirus Files Transfer Script"
. /home/hduser/projectshell/PutAntiVirustoHDFS.sh
echo "Anti Virus Log Files Transfered"

else

echo "No AnitVirus Log File To Process"

fi

#DHCP Logs

filescount=$(ls -lrth /datadump/DHCP | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/DHCP | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling DHCP log Files Transfer Script"
. /home/hduser/projectshell/PutDHCPtoHDFS.sh
echo "DHCP log Files Transfered"

else

echo "No DHCP Log File To Process"

fi

#Nac Logs

filescount=$(ls -lrth /datadump/Nac | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/Nac | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling Nac log Files Transfer Script"
. /home/hduser/projectshell/PutNactoHDFS.sh
echo "Nac log Files Transfered"

else

echo "No Nac Log File To Process"

fi

#Exchange Logs

filescount=$(ls -lrth /datadump/Exchange | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/Exchange | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling Exchange Files Transfer Script"
. /home/hduser/projectshell/PutExchangetoHDFS.sh
echo "Exchange Files Transfered"

else

echo "No Exchange Log File To Process"

fi

#Citrix Logs

filescount=$(ls -lrth /datadump/Citrix | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/Citrix | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling Citrix Files Transfer Script"
. /home/hduser/projectshell/PutCitrixtoHDFS.sh
echo "citrix Files Transfered"

else

echo "No Citrix Log File To Process"

fi

#OWA Logs

filescount=$(ls -lrth /datadump/OWA | grep $(date -d "-1 days"  +%Y%m%d) | wc -l)

files=$(ls -lrth /datadump/OWA | grep $(date -d "-1 days"  +%Y%m%d) | awk '{print $NF}' | head -1)

#Only process if yesterdays's file(s) available...

if [[ $filescount -gt 0 && $files != *.COMPLETED ]]
then

echo "Calling OWA Files Transfer Script"
. /home/hduser/projectshell/PutOWAtoHDFS.sh
echo "OWA Files Transfered"

else

echo "No OWA Log File To Process"

fi
