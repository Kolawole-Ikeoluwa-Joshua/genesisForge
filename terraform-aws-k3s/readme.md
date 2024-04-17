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
