# --- networking/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.vtl_vpc.id
}
