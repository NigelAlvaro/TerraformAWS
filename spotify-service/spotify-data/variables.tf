variable "credentials" {
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })
  description = "Credentials needed to connect to my AWS account"
}


variable "prefix" {
  type = string

  validation {
    condition = length(var.prefix) != 0
    error_message = "Please enter prefix name"
  }
}

variable "throughput" {
  type = object({
    read_capacity  = number
    write_capacity = number
  })
}
