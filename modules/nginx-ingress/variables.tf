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

variable "cluster_id" {
  description = "AWS ECS cluster id"
  type        = string
}

variable "cluster_name" {
  description = "Name of ECS cluster"
  type        = string
}

variable "consul_datacenter" {
  description = "Name of the Consul cluster and datacenter"
  type        = string
}

variable "consul_cluster_tag" {
  description = "Tag used in agent discover-aws plugin for Consul cluster join"
  type        = string
}

variable "encryption_key" {
  description = "Specifies the secret key to use for encryption of Consul network traffic"
  type        = string
  sensitive   = true
}

variable "target_group_arn" {
  description = "Target group ARN to map the ingress traffic from"
  type        = string
}

variable "log_group" {
  description = "The name of the log stream for Nginx logs"
}
