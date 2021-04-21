data "aws_ami" "consul" {
  owners      = ["aws-marketplace"]
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-consul-${var.consul_version}-*"]
  }
}

data "aws_region" "current" {}
