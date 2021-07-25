#instance.sprint0_bastion
variable "dev_instance_type" {
    default = "t2.micro"
    description = "The type of instance to start"
}
variable "dev_ami" {
    description = "The AMI to use for the instance"
}
variable "name_prefix" {
    description = "tag name"
}
variable "key_name" {
    description = "The key name of the instance"
}
variable "bastion_sg_id" {
    description = "The associated security groups"
}
variable "public1_subnet_id" {
    description = "The VPC subnet ID"
}
#instance.ec2-first
variable "lc_instance_type" {
    description = "The type of instance to start"
}
variable "sprint0_private_sg" {
    description = "The associated security groups"
}
variable "private1_subnet_id" {
    description = "The VPC subnet ID"
}
#instance.ec2-second
#variable "private2_subnet_id" {}
