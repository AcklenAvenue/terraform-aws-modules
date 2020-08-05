output "vpc_id" {
  description = "The id of the vpc"
  value       = aws_vpc.vpc.id
}

output "public1_subnet_id" {
  description = "The id of the public1 subnet"
  value       = aws_subnet.public1_subnet.id
}

# output "public1_subnet_id" {
#   description = "The id of the public1 subnet"
#   value       = aws_subnet.public1_subnet.id
# }

# output "public2_subnet_id" {
#   description = "The id of the public2 subnet"
#   value       = aws_subnet.public2_subnet.id
# }

# output "private1_subnet_id" {
#   description = "The id of the private1 subnet"
#   value       = aws_subnet.private1_subnet.id
# }

# output "private2_subnet_id" {
#   description = "The id of the private2 subnet"
#   value       = aws_subnet.private2_subnet.id
# }

# output "rds1_subnet_id" {
#   description = "The id of the rds1 subnet"
#   value       = aws_subnet.rds1_subnet.id
# }

# output "rds2_subnet_id" {
#   description = "The id of the rds2 subnet"
#   value       = aws_subnet.rds2_subnet.id
# }

# output "rds_subnet_group_name" {
#   description = "Name of the subnet group"
#   value       = aws_db_subnet_group.rds_subnetgroup.id
# }
