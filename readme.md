# Introduction

Terraforming AWS, Docker & Kubernetes

## Prerequisites

- AWS Account
- Terraform Installation
- TFEnv - Terraform version manager

## Sections

1. [Terraform Basics & Modular Deployments using Containers](./terraform-docker/readme.md)
2. [Three Tier Rancher K3s Deployment on AWS using Terraform](./terraform-aws-k3s/readme.md)
3. [Deploying Kubernetes Resources with Terraform](./terraform-k8s/readme.md)

## Frequently Used Commands:

```
terraform init

terraform state list

terraform workspace list

terraform workspace show

terraform workspace select <workspace-name>

terraform validate

terraform fmt

terraform plan

terraform console

terraform apply --auto-approve

terraform destroy --auto-approve

terraform refresh

terraform output -json | jq
```