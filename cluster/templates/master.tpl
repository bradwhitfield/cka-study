#!/bin/bash
export KUBEVERSION=1.12.1
apt update
apt upgrade
apt install -y docker.io
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt update
apt-get install -y kubeadm=${KUBEVERSION}-00 kubelet=${KUBEVERSION}-00 kubectl=${KUBEVERSION}-00
wget https://tinyurl.com/yb4xturm -O rbac-kdd.yaml
wget https://tinyurl.com/y8lvqc9g -O calico.yaml
kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version v${KUBEVERSION}
mkdir ~/.kube
cp -i /etc/kubernetes/admin.conf ~/.kube/config
kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f rbac-kdd.yaml
kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f calico.yaml
echo "source <(kubectl completion bash)" >> ~/.bashrc