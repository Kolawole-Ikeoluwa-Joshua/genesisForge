terraform {
  required_providers {
    kubernetes = {
    }
  }
}


provider "kubernetes" {
  config_path = "../k3s-vtl_node-16752.yaml"
}
