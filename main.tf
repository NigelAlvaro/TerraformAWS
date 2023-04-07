provider "aws" {
  region     = var.credentials.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}


resource "aws_instance" "demo_ec2" {
  ami             = data.aws_ami.ami_type.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.bastion_host.name]
  key_name        = aws_key_pair.demokeypair.key_name
  tags = {
    Name = "${var.prefix}-bastion-host"
  }
}

resource "aws_security_group" "bastion_host" {
  name        = "${var.prefix}-bastion-host"
  description = "security group access for all"
  count = length(var.ingress)

  ingress {
    cidr_blocks = var.ingress[count.index].cidr_blocks
    from_port   = var.ingress[count.index].from_port
    to_port     = var.ingress[count.index].from_port
    protocol    = var.ingress[count.index].protocol
  }
  egress {
    cidr_blocks = var.egress.cidr_blocks
    from_port   = var.egress.from_port
    to_port     = var.egress.from_port
    protocol    = var.egress.protocol
  }
}

resource "aws_key_pair" "demokeypair" {
  key_name   = "${var.prefix}-keypair"
  public_key = tls_private_key.rsa.public_key_openssh


}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "keypair" {
  value = nonsensitive(tls_private_key.rsa.private_key_pem)
}
