output "ami_id" {
  description = "The branch AMI id"
  value = aws_ami_from_instance.project-AMI.id
}