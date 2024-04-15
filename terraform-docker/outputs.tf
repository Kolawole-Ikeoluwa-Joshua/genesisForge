# outputs

output "ip-address" {
  value       = flatten(module.container[*].ip-address)
  description = "The Ip address of the container"
}

output "container-name" {
  value       = module.container[*].container-name
  description = "The name of the container"
}