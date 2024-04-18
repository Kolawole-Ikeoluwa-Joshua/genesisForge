# --- loadbalancing/main.tf ---

resource "aws_lb" "vtl_lb" {
  name            = "vtl-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}
