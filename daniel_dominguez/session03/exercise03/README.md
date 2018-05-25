# K8S-training. Session 03 - Exercise 03.

The aim of this exercise is to install a 4 node k8s cluster from scratch.

## How to install 

### Prerequisites

Customize common.bash with the following info\:
- UBUNTU_USER  user in cluster nodes with sudo permissions and with no prompt password access (direct ssh cert access)
- CONTROLLER_PUBLIC_IPS  Controller nodes puplic IP array
- CONTROLLER_PRIVATE_IPS  Controller nodes private IP array matching same order as CONTROLLER_PUBLIC_IPS
- WORKER_PUBLIC_IPS  Worker nodes puplic IP array
- WORKER_PRIVATE_IPS  Worker nodes private IP array matching same order as CONTROLLER_PUBLIC_IPS

### Execution
	1. Exec install.sh from a client workstation with ssh access to your cluster nodes.
	2. Say a prayer

	At the end of the execution hopefully you will have a k8s cluster with 3 (minimum for etcd) master nodes and n (1 in my case) worker nodes with the following config\:
		- containerd as container runtime.
		- Calico network plugin as CNI implementation.
		- traefik ingress controller
		- k8s dashboard installed with readonly permissions
		- admin.kubeconfig with admin user so you can access api server cluster

### Some tips regarding HA config.
	In order to get real load balancing of the api server I have tried to install a keepalived/ha-proxy cluster in two of the master nodes, but I can't move the elastic IP asignned by AWS because I need to configure awscli in nodes and I don't have permission to get the "Secret access key" of my IAM user "Access key ID". Basically keepalived uses a notify_master script that exec the following\:
	aws ec2 disassociate-address –public-ip $EIP
	aws ec2 associate-address –public-ip $EIP –instance-id $INSTANCE_ID
