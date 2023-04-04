variable "credentials" {
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })
  default = {
    region     = "us-west-2"
    access_key = "AKIAYFFGET2KRKDOI2EF"
    secret_key = "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"
  }
  description = "Credentials needed to connect to my AWS account"
}

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

variable "ingress" {
  type = object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
  })

  default = {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  description = "Ingress Config for SG"
}

variable "egress" {
  type = object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
  })

  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "Egress Config for SG"
}

variable "prefix" {
  type = string
}

variable "os_type" {
  type = string
}
