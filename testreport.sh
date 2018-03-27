#!/bin/sh
#########################3
#Created by: Mohan kumar M
#Date:27/04/2017
#Description: show reports based ls
#
#
#######################

var1="$(ls -lrth /datadump/ActiveDir/)"

var2="$(ls -lrth /datadump/Proxy/)"

var3="$(ls -lrth /datadump/AntiVirus/)"

var4="$(ls -lrth /datadump/DHCP/)"

var5="$(ls -lrth /datadump/Nac/)"

var6="$(hadoop fs -ls /user/hdfs/ActiveDir/uncompressed | tail -5)"
var7="$(hadoop fs -ls /user/hdfs/ActiveDir/compressed | tail -5)"
var8="$(hadoop fs -ls /user/hdfs/ActiveDir/stage1 | tail -5)"

var9="$(hadoop fs -ls /user/hdfs/Proxy/uncompressed | tail -5)"
var10="$(hadoop fs -ls /user/hdfs/Proxy/compressed | tail -5)"
var11="$(hadoop fs -ls /user/hdfs/Proxy/stage1 | tail -5)"

var12="$(hadoop fs -ls /user/hdfs/DHCP/uncompressed | tail -5)"
var13="$(hadoop fs -ls /user/hdfs/DHCP/compressed | tail -5)"
var14="$(hadoop fs -ls /user/hdfs/DHCP/stage1 | tail -5)"

var15="$(hadoop fs -ls /user/hdfs/AntiVirus/uncompressed | tail -5)"
var16="$(hadoop fs -ls /user/hdfs/AntiVirus/compressed | tail -5)"

var17="$(hadoop fs -ls /user/hdfs/Nac/uncompressed | tail -5)"
var18="$(hadoop fs -ls /user/hdfs/Nac/compressed | tail -5)"

var19="$(ls -lrth /datadump/Exchange/)"

var20="$(hadoop fs -ls /user/hdfs/Exchange/uncompressed | tail -5)"
var21="$(hadoop fs -ls /user/hdfs/Exchange/compressed | tail -5)"
var22="$(hadoop fs -ls /user/hdfs/Exchange/stage1 | tail -5)"

var23="$(ls -lrth /datadump/Citrix/)"
var24="$(hadoop fs -ls /user/hdfs/Citrix/uncompressed | tail -5)"
var25="$(hadoop fs -ls /user/hdfs/Citrix/compressed | tail -5)"
var26="$(hadoop fs -ls /user/hive/warehouse/masterlogdb.db/citrix | tail -5)"


echo "-----------------------------------------------------------------"
echo "ActiveDir Logs"
echo "${var1}"
echo "-----------------------------------------------------------------"
echo "Proxy Logs"
echo "${var2}"
echo "-----------------------------------------------------------------"
echo "AntiVirus Logs"
echo "${var3}"
echo "-----------------------------------------------------------------"
echo "DHCP Logs"
echo "${var4}"
echo "-----------------------------------------------------------------"
echo "Nac Logs"
echo "${var5}"
echo "-----------------------------------------------------------------"
echo "Exchange Logs"
echo "${var19}"
echo "-----------------------------------------------------------------"
echo "Citrix Logs"
echo "${var23}"
echo "-----------------------------------------------------------------"

echo "                              "

echo "HDFS Exchange Logs"
echo "${var20}"
echo "-----------------------"
echo "${var21}"
echo "-----------------------"
echo "${var22}"
echo "-----------------------------------------------------------------"

echo "HDFS ActiveDir Logs"
echo "${var6}"
echo "-----------------------"
echo "${var7}"
echo "-----------------------"
echo "${var8}"
echo "-----------------------------------------------------------------"
echo "HDFS Proxy Logs"
echo "${var9}"
echo "-----------------------"
echo "${var10}"
echo "-----------------------"
echo "${var11}"
echo "-----------------------------------------------------------------"
echo "HDFS DHCP Logs"
echo "${var12}"
echo "-----------------------"
echo "${var13}"
echo "-----------------------"
echo "${var14}"
echo "-----------------------------------------------------------------"
echo "HDFS AntiVirus Logs"
echo "${var15}"
echo "-----------------------"
echo "${var16}"
echo "-----------------------------------------------------------------"
echo "HDFC Nac Logs"
echo "${var17}"
echo "-----------------------"
echo "${var18}"
echo "-----------------------------------------------------------------"
echo "HDFS Citrix Logs"
echo "${var24}"
echo "-----------------------"
echo "${var25}"
echo "-----------------------"
echo "${var26}"
echo "-----------------------------------------------------------------"

