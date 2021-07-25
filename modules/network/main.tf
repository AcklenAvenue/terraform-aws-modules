resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_subnet" "public_subnets" {
  for_each = { for subnet in var.public_subnets : subnet.name => subnet }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = true

  tags = merge(local.tags, { Name = "${local.name_prefix}-${each.key}" })
}

resource "aws_subnet" "private_subnets" {
  for_each = { for subnet in var.private_subnets : subnet.name => subnet }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = false

  tags = merge(local.tags, { Name = "${local.name_prefix}-${each.key}" })
}
