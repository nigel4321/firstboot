#!/bin/bash

function waitforapt {
	while fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
	   echo "Waiting for apt to finish..."
	   sleep 1
	done
}

waitforapt
apt-get update

waitforapt
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

waitforapt
apt install -y docker.io

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
waitforapt
apt-get update
waitforapt
apt-get install -y kubelet kubeadm

apt-get install -y ansible
