#!/bin/bash

#resultfile
output_file="Incident_Report_System_Resources_$(date +%Y-%m-%d-%H-%M-%S).txt"
echo "Date & Time of Report - $(date +%Y-%m-%d-%H-%M-%S)"

#List of System Resources
echo "====================== System Resources Report =====================" >> "$output_file"
echo " " >> "$output_file"
echo "============= Linux System Tasks ============" >> "$output_file"
top >> "$output_file"
echo "" >> "$output_file"
echo "============= System uptime ============" >> "$output_file"
uptime >> "$output_file"
echo "" >> "$output_file"
echo "============= Currently Running Processes ============" >> "$output_file"
ps aux >> "$output_file"
echo "" >> "$output_file"
echo "============= Memory Usage in MB ============" >> "$output_file"
free -m >> "$output_file"
echo ""
echo "============= Display mounted File System ============" >> "$output_file"
cat /proc/mounts >> "$output_file"
echo ""
echo "====================== System Resources Report =====================" >> "$output_file"

echo "System & Processes resources Incident Report is saved to $output_file"
