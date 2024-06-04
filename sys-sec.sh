#!/bin/bash

# Set the path to the script's directory
SCRIPT_DIR=$(dirname "$0")

# Set the path to the system's log files
LOG_DIR=/var/log

# Set the path to the system's firewall configuration file
FIREWALL_CONFIG=/etc/sysconfig/iptables

# Set the path to the system's SSH configuration file
SSH_CONFIG=/etc/ssh/sshd_config

# Set the path to the system's SELinux configuration file
SELINUX_CONFIG=/etc/selinux/config

# Set the path to the system's system configuration file
SYSTEM_CONFIG=/etc/default/system

# Set the path to the system's network configuration file
NETWORK_CONFIG=/etc/network/interfaces

# Set the path to the system's system users and groups file
USERS_GROUPS_FILE=/etc/passwd

# Set the path to the system's file system permissions file
FS_PERMS_FILE=/etc/group

# Function to check firewall configuration
check_firewall() {
  if [ ! -f "$FIREWALL_CONFIG" ]; then
    echo "Error: Firewall configuration file not found!"
    exit 1
  fi

  # Check if the firewall is enabled
  if grep -q "iptables" "$FIREWALL_CONFIG"; then
    echo "Firewall is enabled."
  else
    echo "Error: Firewall is not enabled!"
    exit 1
  fi
}

# Function to check system updates and patches
check_updates() {
  # Check if there are any pending updates
  if apt-get update -y && apt-get upgrade -y; then
    echo "System is up to date."
  else
    echo "Error: System is not up to date!"
    exit 1
  fi
}

# Function to check SSH configuration
check_ssh() {
  if [ ! -f "$SSH_CONFIG" ]; then
    echo "Error: SSH configuration file not found!"
    exit 1
  fi

  # Check if the SSH server is listening
  if netstat -tlnp | grep -q "ssh"; then
    echo "SSH server is listening."
  else
    echo "Error: SSH server is not listening!"
    exit 1
  fi
}

# Function to check SELinux configuration
check_selinux() {
  if [ ! -f "$SELINUX_CONFIG" ]; then
    echo "Error: SELinux configuration file not found!"
    exit 1
  fi

  # Check if SELinux is enabled
  if grep -q "SELINUX=enforcing" "$SELINUX_CONFIG"; then
    echo "SELinux is enabled."
  else
    echo "Error: SELinux is not enabled!"
    exit 1
  fi
}

# Function to check system logs
check_logs() {
  if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory not found!"
    exit 1
  fi

  # Check if the log files are not empty
  if [ -s "$LOG_DIR/access.log" ]; then
    echo "Log files are not empty."
  else
    echo "Error: Log files are empty!"
    exit 1
  fi
}

# Function to check network configuration
check_network() {
  if [ ! -f "$NETWORK_CONFIG" ]; then
    echo "Error: Network configuration file not found!"
    exit 1
  fi

  # Check if the network interface is up
  if ip addr show | grep -q "eth0"; then
    echo "Network interface is up."
  else
    echo "Error: Network interface is down!"
    exit 1
  fi
}

# Function to check system users and groups
check_users_groups() {
  if [ ! -f "$USERS_GROUPS_FILE" ]; then
    echo "Error: Users and groups file not found!"
    exit 1
  fi

  # Check if there are any suspicious users or groups
  if grep -q "root" "$USERS_GROUPS_FILE"; then
    echo "Root user is present."
  else
    echo "Error: Root user is not present!"
    exit 1
  fi
}

# Function to check file system permissions
check_fs_perms() {
  if [ ! -f "$FS_PERMS_FILE" ]; then
    echo "Error: File system permissions file not found!"
    exit 1```
  if grep -q "root" "$FS_PERMS_FILE"; then
    echo "Root user has correct permissions."
  else
    echo "Error: Root user has incorrect permissions!"
    exit 1
  fi
}

# Run the checks
check_firewall
check_updates
check_ssh
check_selinux
check_logs
check_network
check_users_groups
check_fs_perms

# Exit with a success message
echo "System security checks completed successfully."
exit 0
