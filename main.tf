provider "aws" {
  region = "us-west-1"
  access_key = "AKIAYFFGET2KS6R2NKW5"
  secret_key = "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"
}

# resource "aws_vpc" "DemoVPC" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support = true
#   tags {
#     Name = "DemoVPC"
#   }
# }

# resource "aws_subnet" "DemoSubnet" {
#   cidr_block = "${cidrsubnet(aws_vpc.DemoVPC.cidr_block, 3, 1)}"
#   vpc_id = "${aws_vpc.DemoVPC.id}"
#   availability_zone = "us-east-1a"
# }

resource "aws_instance" "DemoEC2" {
  ami           = "ami-0925fd223898ee5ba"
  instance_type = "t2.micro"
  security_groups =  ["SG-Eddie"]
  key_name   = aws_key_pair.DemoKeypair.key_name
  tags = {
    Name = "DemoEC2"
  }
}

resource "aws_security_group" "SG-Eddie" {
  name = "SG-Eddie" 
  description = "security group" 
  
ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
  tags = {
    Name = "SG-Eddie"
  }
}

resource "aws_key_pair" "DemoKeypair" {
  key_name   = "DemoKeypair"
  public_key = tls_private_key.rsa.public_key_openssh

    tags = {
    Name = "DemoKeypair"
  }
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "NotImportant" {
  value  = nonsensitive(tls_private_key.rsa.private_key_pem)
}