#security_group.sprint0_bastion_sg
variable "name_prefix" {
  description = "The name of the security group"
}
variable "project_name" {
	description = "Sets the project name for resources"
}
variable "vpc_id" {
  description = "The VPC ID"
}
variable "allowed_ssh_ip" {
  description = "CIDR block to allow connection by SSH"
}
variable "bastion_egress_cidr" {
  default = ["0.0.0.0/0"]
  description = "CIDR blocks to allow outbound traffic"
}
#security_group.sprint0_public_sg
variable "public_sg_ingress" {
  type = list(
    object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
  )
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  description = "Can be specified multiple times for each ingress rule"
}
variable "public_egress_cidr" {
  default = ["0.0.0.0/0"]
  description = "CIDR blocks to allow outbound traffic"
}
#security_group.sprint0_private_sg
variable "private_ingress_cidr" {}
variable "private_egress_cidr" {
  default = ["0.0.0.0/0"]
  description = "CIDR blocks to allow inbound traffic"
}
#security_group.sprint0_rds_sg
variable "db_port" {
  description = "The start port and the end range port"
}
