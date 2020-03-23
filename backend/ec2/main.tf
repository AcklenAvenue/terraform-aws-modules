#bastion server

resource "aws_instance" "sprint0_bastion" {
  instance_type = var.dev_instance_type
  ami           = var.dev_ami

  tags = {
    Name = "${var.name_prefix}-bastion"
  }

  key_name               = var.key_name
  vpc_security_group_ids = var.bastion_sg_id
  subnet_id              = var.public1_subnet_id
}

resource "aws_instance" "ec2-first" {
  instance_type = var.lc_instance_type
  ami           = var.dev_ami

  tags = {
    Name = "${var.name_prefix}-ec2"
  }

  key_name               = var.key_name
  vpc_security_group_ids = var.sprint0_private_sg
  subnet_id              = var.private1_subnet_id
  depends_on             = [aws_instance.sprint0_bastion]
}

resource "aws_instance" "ec2-second" {
  instance_type = var.lc_instance_type
  ami           = var.dev_ami

  tags = {
    Name = "${var.name_prefix}-ec2"
  }

  key_name               = var.key_name
  vpc_security_group_ids = var.sprint0_private_sg
  subnet_id              = var.private2_subnet_id
  depends_on             = [aws_instance.ec2-first]
}

resource "aws_s3_bucket_object" "uploadfile" {
  bucket     = "${var.bucket}"
  key        = "${var.project}/${var.branch}/aws_hosts"
  source     = "aws_hosts"
  depends_on = [aws_instance.ec2-second]
}