#-----------Security groups-------

#BASTION
resource "aws_security_group" "sprint0_bastion_sg" {
  name        = "${var.name_prefix}-bastion-sg"
  description = "Used for access to the bastion instance"
  vpc_id      = var.vpc_id

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ip
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.bastion_egress_cidr
  }

  tags = {
    Name = "${var.name_prefix}-SG"
		Project = var.project_name
  }
}

#Public Security group

resource "aws_security_group" "sprint0_public_sg" {
  name        = "${var.name_prefix}-public_sg"
  description = "Used for public and private instances for load balancer access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.public_sg_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  #Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.public_egress_cidr
  }

  tags = {
    Name = "${var.name_prefix}-SG"
		Project = var.project_name
  }
}

#Private Security Group

resource "aws_security_group" "sprint0_private_sg" {
  name        = "${var.name_prefix}-private_sg"
  description = "Used for private instances"
  vpc_id      = var.vpc_id

  # Access from other security groups

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.private_ingress_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.private_egress_cidr
  }

  tags = {
    Name = "${var.name_prefix}-SG"
		Project = var.project_name
  }
}

#RDS Security Group
resource "aws_security_group" "sprint0_rds_sg" {
  name        = "${var.name_prefix}-rds_sg"
  description = "Used for DB instances"
  vpc_id      = var.vpc_id

  #SQL access from public/private security group
  ingress {
    from_port = var.db_port
    to_port   = var.db_port
    protocol  = "tcp"

    security_groups = [
      aws_security_group.sprint0_bastion_sg.id,
      aws_security_group.sprint0_public_sg.id,
      aws_security_group.sprint0_private_sg.id
    ]
  }

  tags = {
    Name = "${var.name_prefix}-SG"
		Project = var.project_name
  }
}
