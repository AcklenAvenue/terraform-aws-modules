variable "name" {
  description = "tag name"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "enable_dns_host" {
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

variable "enable_dns_support" {
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "eip_vpc" {
  default     = true
  description = "Boolean if the EIP is in a VPC or not"
}

variable "rt_public_cidr" {
  default     = "0.0.0.0/0"
  description = "The CIDR block of the route"
}

variable "rt_private_cidr" {
  default     = "0.0.0.0/0"
  description = "The CIDR block of the route"
}

variable "cidrs" {
  type        = map(string)
  description = "Map of the CIDR blocks for the subnets"
}

variable "public_ip_map" {
  default     = true
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
}

variable "private_ip_map" {
  default     = false
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
}

variable "rds_ip_map" {
  default     = false
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
}
