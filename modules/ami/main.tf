resource "aws_ami_from_instance" "project-AMI" {
  name               = "${var.name_prefix}-AMI"
  source_instance_id = var.image_id
}
