# Deploying Kubernetes Resources with Terraform

- Create Terraform Cloud workspace for k8s
- Configure Kubernetes Provider
- First K8s Deployment:

  - set up kubectl with kubeconfig

  ```
  export KUBECONFIG=../k3s-vtl_node-16752.yaml
  ```

  - apply k8s main.tf
