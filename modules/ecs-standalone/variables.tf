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

variable "consul" {
  description = "The Consul master nodes configuration"
  type = object({
    consul_version   = string
    key_name         = string
    instance_type    = string
    min_size         = number
    desired_capacity = number
    max_size         = number
    encryption_key   = string
  })
  default = {
    consul_version   = "1.9.5"
    key_name         = "AA-DevOps"
    instance_type    = "t3.micro"
    min_size         = 1
    desired_capacity = 1
    max_size         = 1
    encryption_key   = "0enygkRn7c3zr8BV1XoziHONF5xcVo+UKo1eE1VDR6E="
  }
}

variable "ecs" {
  description = "The ECS cluster configuration"
  type = object({
    instance_type    = string
    key_name         = string
    min_size         = number
    desired_capacity = number
    max_size         = number
  })
  default = {
    instance_type    = "t3.micro"
    key_name         = "AA-DevOps"
    min_size         = 1
    desired_capacity = 1
    max_size         = 1
  }
}

variable "domain" {
  description = "Domain name for TLS certificates"
  type        = string
}
