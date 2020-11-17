variable "aws_access_key_id" {
  description = "The AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "The AWS secret access key."
  type        = string
}

variable "aws_region" {
  description = "The AWS Region."
  type        = string
}

variable "name" {
  description = "Name used in the resources."
  type        = string
}

variable "project" {
  description = "Project name used in the resources"
  type        = string
}

variable "domain" {
  description = "Name of the hosted zone in Route53."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC."
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "key_name" {
  description = "EC2 SSH pair name."
  type        = string
}
