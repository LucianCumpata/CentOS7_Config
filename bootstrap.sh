#!/bin/bash
config_path="/bootstrap_config"

#This will update the existing programs in the machine
yum update -y

#This will change the hostname
hostname=`awk -F":" '/hostname/{printf("%s",$2)}' ${config_path}/config.yaml
hostnamectl set_hostname ${hostname}

#This will configure existing network interfaces


#This will assign my SSH Key 
mkdir -p ~/.ssh
SSH_KEY=`awk -F":" '/SSH_Public_Key/{printf("%s",$2)}' ${config_path}/config.yaml  

echo $SSH_KEY >> ~/.ssh/authorized_keys
chmod -R go= ~/.ssh

#This will disable password authentication

#Will create an log file in /var/log/system-bootstrap.log
touch /var/log/system-bootstrap.log



#This will inspect /etc/selinux/config and will check if "SELINUX=" is disabled
# and will use command "setenforce 0"
