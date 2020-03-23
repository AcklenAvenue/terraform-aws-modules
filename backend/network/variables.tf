#vpc.sprint0_vpc
variable "vpc_cidr" {}
variable "enable_dns_host" { default = true }
variable "enable_dns_support" { default = true }
variable "name_prefix" {}
#eip.sprint0_eip
variable "eip_vpc" { default = true }
#route_table.sprint0_public_rt
variable "rt_public_cidr" { default = "0.0.0.0/0" }
#default_route_table.sprint0_private_rt
variable "rt_private_cidr" { default = "0.0.0.0/0" }
#subnet.sprint0_public1_subnet
variable "cidrs" {
  type = map(string)
}
variable "public_ip_map" { default = true }
#subnet.sprint0_private1_subnet
variable "private_ip_map" { default = false }
#subnet.sprint0_rds1_subnet
variable "rds_ip_map" { default = false }

data "aws_availability_zones" "available" {}