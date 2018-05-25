#!/bin/bash

source ./common.bash

#
# Kubernetes Control Plane: traefik
#
# At the end of this script you will have running Traefik
#

helm install --name my-traefik --namespace kube-system --set rbac.enabled=true,ssl.enabled=true,serviceType=NodePort,service.nodePorts.https=443,service.nodePorts.http=80 stable/traefik
