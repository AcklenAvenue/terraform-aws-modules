output "bastion_sg_id" {
  description = "The id of the bastion EC2 segurity group"
  value       = aws_security_group.sprint0_bastion_sg.id
}

output "sprint0_public_sg" {
  description = "security group used for public and private instances for load balancer access"
  value       = aws_security_group.sprint0_public_sg.id
}

output "sprint0_private_sg" {
  description = "Security group used for private instances"
  value       = aws_security_group.sprint0_private_sg.id
}

output "sprint0_rds_sg" {
  description = "Security group used for DB instances"
  value       = aws_security_group.sprint0_rds_sg.id
}
