#!/bin/bash

source ./common.bash

#
# Kubernetes Control Plane: kube-proxy
#
# At the end of this script you will have running Kube Controller Manager
#

for i in "${!WORKER_PUBLIC_IPS[@]}"
do

ssh $UBUNTU_USER@${WORKER_PUBLIC_IPS[$i]} "sudo apt install nfs-common -y"

done

helm install stable/nfs-server-provisioner --name nfs-provisioner --namespace kube-system --set persistence.enabled=true,persistence.storageClass="-",persistence.size=10Gi,persistence.storageClass=nfs

