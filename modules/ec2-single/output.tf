output "instance_id" {
  description = "IDs of the ec2 instances in the target group"
  value       = aws_instance.ec2-instance.id
}
