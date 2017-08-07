#!/bin/bash

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum -y update
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install epel-release
yum -y install python-pip
yum -y install docker

pip install --upgrade pip

systemctl enable docker
systemctl start docker

setenforce 0
yum install -y kubelet kubeadm
systemctl enable kubelet && systemctl start kubelet

echo $(hostname) > /etc/nodename
echo "$(hostname -i) $(hostname)" >> /etc/hosts
shutdown -r now
