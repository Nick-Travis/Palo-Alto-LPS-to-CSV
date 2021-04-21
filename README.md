# Palo-Alto-LPS-to-CSV
Bash script to collect Log written rate from Palo Alto Networks firewall and save as CSV file.

<h1>Directions:</h1>
1)Replace <firewall ip> with your firewall IP.<br>  2)Test SNMP command from line 4 of the script.<br>3)Confirm your output looks similar to line 6.<br>
4)Update the remaining variables in #User Specific Variables section.  Save and exit the file.<br>
5)Add the execute permission to the file 'chmod +x Log_Rate_Collection.sh'<br>
6)./Log_Collection_Rate to start data collection.  <br>
7)If you prefer to run as a cronjob remove lines while loop lines 12, 20 and 30.<br>
