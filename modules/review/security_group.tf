resource "aws_security_group" "backend" {
  name        = "${var.name}-backend"
  description = "Security rules for the backend"
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
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
    Name    = var.name
    Project = var.name
  }
}