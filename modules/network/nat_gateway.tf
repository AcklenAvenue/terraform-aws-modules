resource "aws_eip" "elastic_ip" {
  for_each = { for natgateway_config in var.natgateway_mapping : natgateway_config.public_subnet => natgateway_config }
  vpc      = true
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-${each.value.public_subnet}"
  })
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each = { for natgateway_config in var.natgateway_mapping : natgateway_config.public_subnet => natgateway_config }

  allocation_id = aws_eip.elastic_ip[each.value.public_subnet].id
  subnet_id     = aws_subnet.public_subnets[each.value.public_subnet].id

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-${each.value.public_subnet}"
  })

  depends_on = [aws_internet_gateway.main]
}
