module "network" {
  source   = "./network"
  name     = var.name
  vpc_cidr = var.vpc_cidr

  cidrs = {
    public1  = "10.0.1.0/24"
    public2  = "10.0.2.0/24"
    private1 = "10.0.3.0/24"
    private2 = "10.0.4.0/24"
    rds1     = "10.0.5.0/24"
    rds2     = "10.0.6.0/24"
  }
}

resource "aws_instance" "bastion" {
  instance_type          = var.instance_type
  ami                    = var.ami
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = module.network.public1_subnet_id

  tags = {
    Name = "${var.name}-bastion"
  }
}

resource "aws_security_group" "security_group" {
  name        = "${var.name}-bastion"
  description = "Used for access to the bastion instance."
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}
