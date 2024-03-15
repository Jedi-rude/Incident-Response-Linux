#!/bin/bash
#resultfile
output_file="Incident_Report_Logs_Entries_$(date +%Y-%m-%d-%H-%M-%S).txt"

#List of Log Entries
echo "====================== Logs Entries =====================" >> "$output_file"
echo " " >> "$output_file"
echo "============= System Messages Logs ============" >> "$output_file"
cat /var/log/messages >> "$output_file"
echo "" >> "$output_file"
echo "============= Users Authentication Logs ============" >> "$output_file"
cat /var/log/auth.log >> "$output_file"
echo "" >> "$output_file"
echo "============= System Boot Logs ============" >> "$output_file"
cat /var/log/boot.log >> "$output_file"
echo "" >> "$output_file"
echo "============= Kernel Ring Buffer Logs ============" >> "$output_file"
cat /var/log/dmesg >> "$output_file"
echo ""
echo "============= kernel logs ============" >> "$output_file"
cat /var/log/kern.log >> "$output_file"
echo ""
echo "============= Syslogs ============" >> "$output_file"
cat /var/log/syslog >> "$output_file"
echo ""
echo "====================== Logs Entries =====================" >> "$output_file"

echo "Logs Entries Incident Report is saved to $output_file"
