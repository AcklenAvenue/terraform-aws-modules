output "instances_id" {
  description = "IDs of the ec2 instances in the target group"
  value = [
      "ec2-first"  = aws_instance.ec2-first.id,
      "ec2-second" = aws_instance.ec2-second.id
  ]
}
