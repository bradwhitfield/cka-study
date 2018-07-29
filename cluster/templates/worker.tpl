#!/bin/bash
apt update
apt upgrade
apt install -y docker.io
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt update
apt-get install -y kubeadm=1.9.1-00 kubelet=1.9.1-00
