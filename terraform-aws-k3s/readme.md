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
  ssh into ec2 instance and view kubernetes nodes

```
ubuntu@vtl-29208:~$ kubectl get nodes
NAME        STATUS   ROLES                  AGE     VERSION
vtl-29208   Ready    control-plane,master   5m19s   v1.29.3+k3s1
```
