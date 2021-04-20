resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_route_table" "private_route_table" {
  for_each = { for natgateway_config in var.natgateway_mapping : natgateway_config.public_subnet => natgateway_config }

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[each.value.public_subnet].id
  }

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_route_table_association" "public_route_table_association" {
  for_each = { for subnet in var.public_subnets : subnet.name => subnet }

  subnet_id      = aws_subnet.public_subnets[each.value.name].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  for_each = { for configuration in local.nat_gateways_configuration : configuration.id => configuration }

  route_table_id = aws_route_table.private_route_table[each.value.public_subnet].id
  subnet_id      = aws_subnet.private_subnets[each.value.private_subnet].id
}
