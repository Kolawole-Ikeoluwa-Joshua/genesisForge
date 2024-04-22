data "terraform_remote_state" "kubeconfig" {
  backend = "remote"

  config = {
    organization = "vtl-terraform"
    workspaces = {
      name = "vtl-dev"
    }
  }
}
