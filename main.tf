provider "aws" {
  region = var.credentials.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}

resource "aws_instance" "demo_ec2" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  security_groups =  [aws_security_group.bastion_host.name]
  key_name   = aws_key_pair.demokeypair.key_name
  tags = {
    Name = "${var.prefix}-bastion-host"
  }
}

resource "aws_security_group" "bastion_host" {
  name = "${var.prefix}-bastion-host" 
  description = "security group access for all" 
  
ingress {
    cidr_blocks = var.ingress.cidr_blocks
    from_port = var.ingress.from_port
    to_port = var.ingress.from_port
    protocol = var.ingress.protocol
  }
egress {
    cidr_blocks = var.egress.cidr_blocks
    from_port = var.egress.from_port
    to_port = var.egress.from_port
    protocol = var.egress.protocol
 }
}

resource "aws_key_pair" "demokeypair" {
  key_name   = "${var.prefix}-KeyPair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "keypair" {
  value  = nonsensitive(tls_private_key.rsa.private_key_pem)
}