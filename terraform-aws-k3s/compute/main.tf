# --- compute/main.tf ---

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "random_id" "vtl_node_id" {
  byte_length = 2
  count       = var.instance_count
  keepers = {
    "key_name" = var.key_name
  }
}

resource "aws_key_pair" "vtl_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}
resource "aws_instance" "vtl_node" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  tags = {
    Name = "vtl_node-${random_id.vtl_node_id[count.index].dec}"
  }
  key_name               = aws_key_pair.vtl_auth.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]
  user_data = templatefile(var.user_data_path,
    {
      nodename    = "vtl-${random_id.vtl_node_id[count.index].dec}"
      db_endpoint = var.db_endpoint
      dbuser      = var.dbuser
      dbpass      = var.dbpassword
      dbname      = var.dbname
    }
  )
  root_block_device {
    volume_size = var.vol_size
  }
}

resource "aws_lb_target_group_attachment" "vtl_tg_attach" {
  count            = var.instance_count
  target_group_arn = var.lb_target_group_arn
  target_id        = aws_instance.vtl_node[count.index].id
  port             = var.tg_port
}
