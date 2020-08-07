variable "name" {
  description = "Name used in the resources."
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC."
}

variable "instance_type" {
  description = "EC2 instance type."
}

variable "ami" {
  description = "EC2 ami."
}

variable "key_name" {
  description = "EC2 SSH pair name."
}