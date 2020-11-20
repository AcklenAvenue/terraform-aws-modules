resource "aws_instance" "ec2-instance" {
  instance_type = var.dev_instance_type
  ami           = var.dev_ami

  tags = {
    Name = "${var.name_prefix}-instance"
  }

  key_name               = var.key_name
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.public1_subnet_id
}
