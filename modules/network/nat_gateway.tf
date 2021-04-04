resource "aws_eip" "elastic_ip" {
  vpc = true

  tags = {
    Name        = local.name_prefix
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnets[var.natgateway_subnet_name].id

  tags = {
    Name        = local.name_prefix
    Project     = var.project
    Environment = var.environment
  }
}
