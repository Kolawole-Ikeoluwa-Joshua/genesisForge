terraform {
  backend "remote" {
    organization = "vtl-terraform"

    workspaces {
      name = "vtl-k8s"
    }
  }
}
