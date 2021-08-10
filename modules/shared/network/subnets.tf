resource "aws_subnet" "public1_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["public1"]
  map_public_ip_on_launch = var.public_ip_map
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name    = "${var.name}-public1"
    Project = var.project
  }
}

resource "aws_subnet" "public2_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["public2"]
  map_public_ip_on_launch = var.public_ip_map
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name    = "${var.name}-public2"
    Project = var.project
  }
}

resource "aws_subnet" "private1_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["private1"]
  map_public_ip_on_launch = var.private_ip_map
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name    = "${var.name}-private1"
    Project = var.project
  }
}

resource "aws_subnet" "private2_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["private2"]
  map_public_ip_on_launch = var.private_ip_map
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name    = "${var.name}-private2"
    Project = var.project
  }
}

resource "aws_subnet" "rds1_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["rds1"]
  map_public_ip_on_launch = var.rds_ip_map
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name    = "${var.name}-rds1"
    Project = var.project
  }
}

resource "aws_subnet" "rds2_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidrs["rds2"]
  map_public_ip_on_launch = var.rds_ip_map
  availability_zone       = data.aws_availability_zones.available.names[2]

  tags = {
    Name    = "${var.name}-rds2"
    Project = var.project
  }
}
