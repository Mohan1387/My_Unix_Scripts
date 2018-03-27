#!/bin/bash

########Calling Logrotate and rename eventlog.csv to eventlog.csv.1#################################

#/usr/sbin/logrotate -f /root/scripts/logrotate_custom.conf

########Rename eventlog.csv.1 file with yesterdays timestamp########################################

#mv /datadump/AntiVirus/eventlog.csv.1 /datadump/AntiVirus/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
mv /datadump/AntiVirus/eventlog.csv /datadump/AntiVirus/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/AntiVirus/eventlog.csv.$(date -d yesterday +%Y%m%d)*

#mv /datadump/ActiveDir/eventlog.csv.1 /datadump/ActiveDir/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
mv /datadump/ActiveDir/eventlog.csv /datadump/ActiveDir/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/ActiveDir/eventlog.csv.$(date -d yesterday +%Y%m%d)*

#mv /datadump/Proxy/eventlog.csv.1 /datadump/Proxy/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
mv /datadump/Proxy/eventlog.csv /datadump/Proxy/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/Proxy/eventlog.csv.$(date -d yesterday +%Y%m%d)*

#mv /datadump/Nac/eventlog.csv.1 /datadump/Nac/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
mv /datadump/Nac/eventlog.csv /datadump/Nac/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/Nac/eventlog.csv.$(date -d yesterday +%Y%m%d)*

#mv /datadump/DHCP/eventlog.csv.1 /datadump/DHCP/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
#mv /datadump/DHCP/eventlog.csv /datadump/DHCP/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
#chown hduser:hadoop /datadump/DHCP/eventlog.csv.$(date -d yesterday +%Y%m%d)*

mv /datadump/Exchange/eventlog.csv /datadump/Exchange/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/Exchange/eventlog.csv.$(date -d yesterday +%Y%m%d)*

mv /datadump/Citrix/eventlog.csv /datadump/Citrix/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/Citrix/eventlog.csv.$(date -d yesterday +%Y%m%d)*

mv /datadump/OWA/eventlog.csv /datadump/OWA/eventlog.csv.$(date -d yesterday +%Y%m%d%H%M)
chown hduser:hadoop /datadump/OWA/eventlog.csv.$(date -d yesterday +%Y%m%d)*

sudo /usr/bin/systemctl restart syslog-ng

####################################################################################################

