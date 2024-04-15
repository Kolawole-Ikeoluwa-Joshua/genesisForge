# outputs

output "ip-address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*].ip_address, i.ports[*]["external"])]
  description = "The Ip address of the container"
}

output "container-name" {
  value       = docker_container.nodered_container.name
  description = "The name of the container"
}