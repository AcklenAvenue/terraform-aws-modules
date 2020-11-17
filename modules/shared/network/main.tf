resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_host
  enable_dns_support   = var.enable_dns_support
  instance_tenancy     = "default"

  tags = {
    Name    = var.name
    Project = var.project
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = var.name
    Project = var.project
  }
}

resource "aws_eip" "eip" {
  vpc        = var.eip_vpc
  depends_on = [aws_internet_gateway.internet_gateway]

  tags = {
    Name    = var.name
    Project = var.project
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rt_public_cidr
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name    = "${var.name}-public"
    Project = var.project
  }
}

resource "aws_default_route_table" "private_rt" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block     = var.rt_private_cidr
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name    = "${var.name}-private"
    Project = var.project
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public1_subnet.id
  depends_on    = [aws_internet_gateway.internet_gateway]

  tags = {
    Name    = "${var.name}"
    Project = var.project
  }
}
