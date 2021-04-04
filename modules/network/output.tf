output "vpc_id" {
  description = "Main vpc id"
  value       = aws_vpc.main.id
}

output "public_subnets_ids" {
  description = "Available public subnet ids"
  value = {
    for subnet in aws_subnet.public_subnets : subnet.tags["Name"] => subnet.id
  }
}

output "private_subnets_ids" {
  description = "Available private subnet ids"
  value = {
    for subnet in aws_subnet.private_subnets : subnet.tags["Name"] => subnet.id
  }
}

output "security_group_ids" {
  description = "Security groups ids"
  value = {
    for security_group in aws_security_group.security_groups : trimprefix(security_group.name, "${local.name_prefix}-") => security_group.id
  }
}

output "private_subnets_cidrs" {
  description = "Available private subnet ids"
  value = {
    for subnet in aws_subnet.private_subnets : subnet.tags["Name"] => subnet.cidr_block
  }
}

output "public_subnets_cidrs" {
  description = "Available public subnet ids"
  value = {
    for subnet in aws_subnet.public_subnets : subnet.tags["Name"] => subnet.cidr_block
  }
}
