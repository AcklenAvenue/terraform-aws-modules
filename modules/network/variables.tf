variable "project" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "version_string" {
  description = "Version of the infrastructure"
  type        = string
}

variable "cidr_block" {
  description = "Main vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "natgateway_mapping" {
  description = "The Subnet names in which the NAT gateways will be placed"
  type = set(object({
    public_subnet   = string
    private_subnets = list(string)
  }))
  default = []
}

variable "public_subnets" {
  description = "Public subnets configuration"
  type = set(object({
    name              = string
    availability_zone = string
    cidr_block        = string
  }))
}

variable "private_subnets" {
  description = "Private subnets configuration."
  type = set(object({
    name              = string
    availability_zone = string
    cidr_block        = string
  }))
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
