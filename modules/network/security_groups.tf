resource "aws_security_group" "security_groups" {
  for_each = { for security_group in var.security_groups : security_group.name => security_group }

  name        = "${local.name_prefix}-${each.value.name}"
  description = each.value.description
  vpc_id      = aws_vpc.main.id

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_security_group_rule" "ingress" {
  for_each = { for ingress in local.ingress : ingress.security_group_identifier => ingress }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = length(each.value.cidr_blocks) != 0 ? each.value.cidr_blocks : null
  security_group_id = aws_security_group.security_groups[each.value.security_group_name].id

  source_security_group_id = (
    each.value.security_group != null ?
    aws_security_group.security_groups[each.value.security_group].id : null
  )
}

resource "aws_security_group_rule" "egress" {
  for_each = { for egress in local.egress : egress.security_group_identifier => egress }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = length(each.value.cidr_blocks) != 0 ? each.value.cidr_blocks : null
  security_group_id = aws_security_group.security_groups[each.value.security_group_name].id

  source_security_group_id = (
    each.value.security_group != null ?
    aws_security_group.security_groups[each.value.security_group].id : null
  )
}
