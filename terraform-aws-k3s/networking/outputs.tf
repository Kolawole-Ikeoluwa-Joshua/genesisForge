# --- networking/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.vtl_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.vtl_rds_subnetgroup.*.name
}

output "db_security_group" {
  value = [aws_security_group.vtl_sg["rds"].id]
}

output "public_sg" {
  value = aws_security_group.vtl_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.vtl_public_subnet.*.id
}
