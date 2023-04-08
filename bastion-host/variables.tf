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

  validation {
    condition = length(var.prefix) != 0
    error_message = "Please enter prefix name"
  }
}

variable "os_type" {
  type = string

  validation {
    condition = var.os_type == "linux" ||var.os_type == "ubuntu"||var.os_type == "windows"
    error_message = "The OS type must be either 'linux', 'ubuntu', or 'windows'"
  }
}
