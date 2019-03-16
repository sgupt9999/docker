#!/bin/bash
#######################################################################
### Install docker on RHEL/Centos
#######################################################################


INSTALLPACKAGES="yum-utils device-mapper-persistent-data lvm2"

if [[ $EUID != "0" ]]
then
        echo "ERROR. Need to have root privileges to run this script"
        exit 1
fi
	
echo "Installing docker ........"
yum install $INSTALLPACKAGES -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
echo "Done"

systemctl enable --now docker

