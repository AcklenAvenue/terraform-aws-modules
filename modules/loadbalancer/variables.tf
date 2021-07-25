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

variable "domain" {
  description = "Domain name for TLS certificates"
  type        = string
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group"
  type        = string
}

variable "subnets" {
  description = "Subnet ids list where the application load balancer is placed"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group ids for the application load balancer"
  type        = list(string)
}

variable "target_groups" {
  description = "Target groups configuration"
  type = set(object({
    name                = string
    protocol            = string
    port                = number
    path                = string
    healthcheck_path    = string
    healthcheck_port    = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval            = number
    matcher             = number
  }))
}