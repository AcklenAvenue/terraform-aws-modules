data "aws_acm_certificate" "certificate" {
  domain   = "*.acklenavenueclient.com"
  statuses = ["ISSUED"]
}

data "aws_vpcs" "vpc" {
  tags = {
    Name = var.project
  }
}

data "aws_subnet" "private1" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-private1"]
  }
}

data "aws_subnet" "private2" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-private2"]
  }
}
