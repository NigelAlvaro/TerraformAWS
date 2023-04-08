
locals {
  os_type = {
    linux = "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"
    ubuntu = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"
    windows = "Windows_Server-2022-English-Full-Base-2023.03.15"
  }
}

data "aws_ami" "ami_type" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = [local.os_type["${var.os_type}"]]
  }
}