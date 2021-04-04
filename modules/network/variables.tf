variable "project" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "cidr_block" {
  description = "Main vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "natgateway_subnet_name" {
  description = "The Subnet name of the subnet in which the NAT gateway will be placed"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets configuration."
  type = set(object({
    name              = string
    availability_zone = string
    cidr_block        = string
  }))
  default = [{
    name              = "my-subnet"
    availability_zone = "eu-central-1a",
    cidr_block        = "10.0.0.0/24"
  }]
}

variable "private_subnets" {
  description = "Private subnets configuration."
  type = set(object({
    name              = string
    availability_zone = string
    cidr_block        = string
  }))
  default = [{
    name              = "my-subnet"
    availability_zone = "eu-central-1a",
    cidr_block        = "10.0.0.1/24"
  }]
}

variable "security_groups" {
  description = "Security groups configuration that doesn't depend on any other security group"
  type = set(object({
    name        = string
    description = string
    ingress = set(object({
      from_port      = number
      to_port        = number
      protocol       = string
      cidr_blocks    = list(string)
      security_group = string
    }))
    egress = set(object({
      from_port      = number
      to_port        = number
      protocol       = string
      cidr_blocks    = list(string)
      security_group = string
    }))
  }))
}
