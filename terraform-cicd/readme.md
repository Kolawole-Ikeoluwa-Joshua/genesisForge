## Terraform Networking Module

- Set up Github Account
- Create repository: terraform-aws-networking and upload HCL manifests
- Configure Terraform Cloud Workspace
- Connect Workspace to Repository
- Create Access Keys using AWS IAM
- Setup Terraform Variables & Environment Variables
- Create a New Run (Plan & Apply)
- Make a change and commit, tag push to terraform-aws-networking repo ==> Notice automated terraform plan
- Publish a module: remember git tags

## Terraform Compute Module

- Create repository: terraform-aws-compute
- Clone repository in `terraform-cicd` directory
- upload HCL manifests, commit, branch main, tag and push terraform-aws-compute
- Publish a module using terraform-aws-compute repo: remember git tags

## Utilize Configuration Designer to Create Deployments

- Create a New Run using Modules (Plan & Apply)
- Use run configuration file to create `deployments/main.tf`

## Continuous Deployment

- Set up Providers
- Configure Github resources in Terraform
- Configure Terraform Cloud resources in Terraform
- Deploy Module-Based Infrastructure
- Optional: Push or Pull Remote State
- Updating compute auth public_keys
- Destroying Infrastructure (queuing destroy plans)
