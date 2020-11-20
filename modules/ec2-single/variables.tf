#instance.sprint0_bastion
variable "dev_instance_type" {
  default     = "t2.micro"
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
variable "sg_id" {
  description = "The associated security groups"
}
variable "public1_subnet_id" {
  description = "The VPC subnet ID"
}
