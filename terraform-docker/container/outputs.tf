# # outputs
output "application_access" {
  value = { for x in docker_container.app_container[*] : x.name => join(":", x.network_data[*].ip_address, x.ports[*]["external"]) }
}
