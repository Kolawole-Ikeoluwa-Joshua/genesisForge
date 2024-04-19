output "lb_target_group_arn" {
  value = aws_lb_target_group.vtl_tg.arn
}

output "lb_endpoint" {
  value = aws_lb.vtl_lb.dns_name
}
