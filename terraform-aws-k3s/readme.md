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