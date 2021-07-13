variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}
variable "project" {
  description = "Name of the project"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
variable "autoscaling_name" {
  type    = string
  description = "Adds metrics of Autoscaling Groups to dashboard by using autoscaling group name"
  default = ""
}
variable "cloudfront_id" {
  type = string
  description = "Adds metrics of Cloudfront to dashboard by using Cloudfront ID"
  default = ""
}
variable "ecs_name" {
  type = string
  description = "Adds metrics of Elastic Container Service to dashboard by using Elastic Container Service Name"
  default = ""
}

variable "rds_id"{
  type = string
  description ="Adds metrics of Relational Database Service to dashboard by using Relational Database Service Identifier"
  default = ""
}

variable "rdsCluster_id"{
  type = string
  description =  "Adds metrics of Relational Database Cluster to dashboard by using Relational Database Cluster Identifier"
  default = ""
}