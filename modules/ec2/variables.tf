#instance.sprint0_bastion
variable "dev_instance_type" { default = "t2.micro" }
variable "dev_ami" {}
variable "name_prefix" {}
variable "key_name" {}
variable "bastion_sg_id" {}
variable "public1_subnet_id" {}
#instance.ec2-first
variable "lc_instance_type" {}
variable "sprint0_private_sg" {}
variable "private1_subnet_id" {}
#instance.ec2-second
variable "private2_subnet_id" {}
