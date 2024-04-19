# --- compute/outputs.tf ---

output "instance" {
  value     = aws_instance.vtl_node[*]
  sensitive = true
}
