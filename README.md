# Incident-Response-Linux
Linux Incident Management Scripts
This repository contains basic Incident Response Investigation scripts. This scripts are mainly runs on Bash shell. These scripts are only tested on Debian based distros.

## Table of Content
- [Users Management Commands](#users-managemen)
- [Network Settings Management Commands](#network-setting)
- [System Resources Commands](##system)
- [Processes & Services Commands](##procsess)
- [Logs Entries Management](##logs)

### Users Managements
commands for investigating linux users activities, permissions and information.
- `cat /etc/passwd ` - List of Users Accounts
- `egrep -e '/bin/(ba)?sh' /etc/passwd` - Lists of users who have shell access
- `cat /etc/group` - List of User Groups
- `cat /etc/sudoers` - Sudoers Accounts
- `lastlog` - Most Recent Logins
- `last` - Last Login Users
- `who` - Current Login Users
- `w` - Currently Logged in Users & Activities
- `sudo -l` - Displays list of permitted commands 

### Network Settings Management Commands
commands to see netwrok configurations 
- `ifconfig -a` - All Network Interfaces
- `more /etc/resolv.conf` - DNS Information
- `more /etc/hosts` - Hosts File Information
- `netstat -antup` - Active Network Connections
- `iptables -L -n -v ` - Show All Iptables Rules
- `route -n` - Show Routing Table in numeric form
- `ss -tuln` - Listening Ports & Connections
- `arp -vn` - to see the ARP table

### System Resources Commands
commands to see linux system resources 
- `top` - Linux System Tasks
- `uptime` - System uptime
- `ps aux` - Currently Running Processes
- `free -m` - Memory Usage in MB
- `cat /proc/mounts` - Display mounted File System
- `df -h` - free disk space(Hard Disk) on all the file systems
- `vmstat -a` - statistics for system processes, memory, swap, I/O, and the CPU
- `lsof` - list of all the open files and processes
- `ls /etc/rc*` - lists of bootup services
- `cat /etc/*release` - Displays Os version details

### Processes & Services Commands
commands for linux system processes & services
- `ps -ef` - All Running Processes
- `pstree -p` - Process Tree with PIDs
- `ps -axjf` - Show Running Processes in a Tree-like Format
- `top -n 1` - Top Processes
- `service --status-all` - List of all services
- `chkconfig --list` - List of all services & current state
- `systemctl list-units --type=service` - List of running services
- `jobs` - list of background jobs
- `cat /etc/crontab` - Displays running cron jobs
- `ls -la /etc/cron.d` - Displays software package used for specified cron job

### Logs Entries Management
commands for logs entries
- `cat /var/log/messages` - System Messages Logs
- `cat /var/log/auth.log` - Users Authentication Logs
- `cat /var/log/boot.log` - System Boot Logs
- `cat /var/log/dmesg` - Kernel Ring Buffer Logs
- `cat /var/log/kern.log` - kernel logs
- `cat /var/log/syslog` - Syslogs messages

###  System Security Status script
This script performs a series of checks to ensure the system is secure and compliant with security best practices. It checks for:
- Firewall configuration
- System updates and patches
- SSH configuration
- SELinux configuration
- System logs
- Network configuration
- System users and groups
- File system permissions

`sys-sec.sh` -script name

Note that this script is just a starting point and may need to be modified to fit the specific needs of your system and security requirements.

## Running the Scripts
make sure the required permissions for this script is given & add execution permissions for this script. Do following steps after downloading the scripts.
```
chmod +x irscript.sh
./irscript.sh
```

## Conclusion 

This incident response scripts are basic form of investigations and can modify based on scenario. Do more Practice and Expert it!. <br>
**3/15/2024** <br>
Contributed By - Jord@n
