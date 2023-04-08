variable "credentials" {
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })
  description = "Credentials needed to connect to my AWS account"
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
