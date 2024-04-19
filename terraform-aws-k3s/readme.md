# Prerequisites

- Terraform Cloud (manage state)

```
# set up backends.tf

# to access remote backend with API token:
terraform login

# initialize backend
terraform init


# update terraform cloud execution mode
local ==> plans and applies occur on machines you control. Terraform cloud is only used to store and sync state
```

## Processes:

1. Networking Infrastructure Setup:

- Create VPC
- Create AZs, Subnets (public & private)
- Create Route Tables & Internet Gateway
- Create Security Groups
- Create DB Subnet Group

2. Kubernetes Control Plane Database (Amazon RDS MySQL):

- Create RDS Instance

3. Load Balancer (AWS Application Load Balancer):

- Create ALB Security Group & Subnets
- Create ALB Target Group
- Create ALB Listener

4. Kubernetes Nodes (EC2 Instances):

- Create EC2 Instance
- Create SSH Keys

```
ssh-keygen -t rsa
```

- Create Rancher K3s token using EC2 User Data & Terraform `templatefile`

```
# ssh into ec2 instance and view kubernetes nodes

ubuntu@vtl-27812:~$ kubectl get nodes
NAME        STATUS   ROLES                  AGE   VERSION
vtl-27812   Ready    control-plane,master   20m   v1.29.3+k3s1
vtl-7672    Ready    control-plane,master   6s    v1.29.3+k3s1
```

5. Test K8s Deployment:

```
# deploy Nginx by creating a deployment manifest `deployment.yaml` on deployed ec2 instance

ubuntu@vtl-27812:~$ kubectl create -f deployment.yaml
deployment.apps/nginx created

ubuntu@vtl-27812:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-77d6466568-8vh2m   1/1     Running   0          5m31s
nginx-77d6466568-d5rx5   1/1     Running   0          5m31s

# access nginx from web browser using <ec2_public_ip:8000>
```

6. Add EC2 to ALB Target Group:

- Create EC2 Compute ALB Target Group Attachment

7. Use terraform `local-exec` Provisioner to SCP kubeconfig file to terraform machine:

- install kubectl on terraform machine

```
snap install kubectl --classic
kubectl version --client
```

- open all ports on ec2 instance, Note: for testing dev environments only
- deploy infrastructure
- set kubeconfig on terraform machine

```
joshua:~/environment/terraform-aws $ export KUBECONFIG=../k3s-vtl_node-43223.yaml

joshua:~/environment/terraform-aws $ kubectl get nodes
NAME        STATUS   ROLES                  AGE     VERSION
vtl-43223   Ready    control-plane,master   3m36s   v1.29.3+k3s1
```
