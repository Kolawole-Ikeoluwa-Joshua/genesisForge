//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "app.terraform.io/vtl-terraform/compute/aws"
  version = "1.0.1"

  aws_region          = "us-east-1"
  public_key_material = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRW9Qp/9QAYdzHs/0mxp0KFc+CeWqSeMRmbuWI8mvk6Qgfb3Wa8AHvI3iQuBBCaEtovCu7YdjLETcWiaNMTOqmYwFtFN9wMjaIzrwySFAEzh0XDuAC4XKxDCUK6Yb+u4ZaPOvAlrvkE4RLmnU+sNQRrZ4ObFYZehwUtAvs+AHjdYH0UmTUW8B69II9q6j0y54Hod8rDzHSA2BL9I/ZME0eNdIUrIqA1bcfk3c4DYzUmNG+K2y7vi30KnjzZy55r+J7iIdLAnGaKGr45h9/x/sRu7MHRNcyohULyY8qGNWAD6pDp4Evgk4opDF3mUcpVegkf736Xp/g4RsotjnhiX3T+w9+xweddhp73KknsbotabkQN5lICI8VvM7Jw6I1uMem8wrEluN89xWLym6Icm5WDQvru4OUrV7FWwRBjwQS7qC9WHW2fOXFjiwzz3CtRJPLqwGgiWsvqeDBuotMeTJ+XE0ELX+l7UIJ4GUy+4Qyzot6PeDEO0rayLBwyUJOC70= ubuntu@ip-172-31-62-110"
  public_sg           = module.networking.public_sg
  public_subnets      = module.networking.public_subnets
}

module "networking" {
  source  = "app.terraform.io/vtl-terraform/networking/aws"
  version = "1.0.0"

  access_ip  = "0.0.0.0/0"
  aws_region = "us-east-1"
}
