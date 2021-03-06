#!/bin/bash

yum -y update
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install epel-release
yum -y install python-pip
yum -y install docker

pip install --upgrade pip
pip install docker-compose

systemctl enable docker
systemctl start docker

cd /tmp
git clone https://github.com/vegasbrianc/prometheus.git
cd prometheus
docker-compose up -d
