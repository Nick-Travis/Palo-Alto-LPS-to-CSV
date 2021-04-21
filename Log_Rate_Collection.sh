#This script collects the log written rate via SNMP from a single fireall and stores the results as a CSV file for analyzing with excel or similar tool.
#
#SNMP command to test before using script
#snmpget -v2c -c public <firewall ip> .1.3.6.1.4.1.25461.2.1.2.7.1.2.0
#Expected SNMP command results(10 in this sample is the log written rate and will be different for everyone)
#SNMPv2-SMI::enterprises.25461.2.1.2.7.1.2.0 = Gauge32: 10

#User Specific Variables
firewall_ip="<firewall ip>"
snmp_community="public"
snmp_version="-v2c" #only version supported with this script
collection_interval=60 #in seconds
log_file="LPS.csv"

#Statics variables you (likely) should not need to change
snmp_oid=".1.3.6.1.4.1.25461.2.1.2.7.1.2.0"

#collection loop
while true
do
  get_command="snmpget $snmp_version -c $snmp_community $firewall_ip $snmp_oid"
  results=`$get_command`

  LPS=`echo $results | awk {'print $4'}`
  echo $LPS

  log_entry="`date +"%m-%d-%Y %T"`,$LPS"
  echo $log_entry>>$log_file
  sleep $collection_interval
done
