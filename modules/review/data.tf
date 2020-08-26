data "aws_security_group" "consul" {
  tags = {
    Project = var.project,
    Rule    = "consul"
  }
}

data "aws_security_group" "ssh" {
  tags = {
    Project = var.project,
    Rule    = "ssh"
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
