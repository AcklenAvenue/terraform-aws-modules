output "instances_id" {
  description = "IDs of the ec2 instances in the target group"
  value = [
    aws_instance.ec2-first.id,
    aws_instance.ec2-second.id
  ]
}
