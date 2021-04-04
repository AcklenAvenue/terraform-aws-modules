resource "aws_security_group" "security_groups" {
  for_each = { for security_group in var.security_groups : security_group.name => security_group }

  name        = "${local.name_prefix}-${each.value.name}"
  description = each.value.description
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "${local.name_prefix}-${each.value.name}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "ingress" {
  for_each = { for ingress in flatten(local.ingress) :
    (ingress.security_group != null ?
      "ingress-${ingress.security_group_identifier}-${ingress.security_group}-${ingress.from_port}" :
    "ingress-${ingress.security_group_identifier}-${ingress.from_port}") => ingress
  }

  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  cidr_blocks              = length(each.value.cidr_blocks) != 0 ? each.value.cidr_blocks : null
  source_security_group_id = each.value.security_group != null ? aws_security_group.security_groups[each.value.security_group].id : each.value.security_group
  security_group_id        = aws_security_group.security_groups[each.value.security_group_identifier].id
}

resource "aws_security_group_rule" "egress" {
  for_each = { for egress in flatten(local.egress) :
    (egress.security_group != null ?
      "egress-${egress.security_group_identifier}-${egress.security_group}-${egress.from_port}" :
    "egress-${egress.security_group_identifier}-${egress.from_port}") => egress
  }

  type                     = "egress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  cidr_blocks              = length(each.value.cidr_blocks) != 0 ? each.value.cidr_blocks : null
  source_security_group_id = each.value.security_group != null ? aws_security_group.security_groups[each.value.security_group].id : each.value.security_group
  security_group_id        = aws_security_group.security_groups[each.value.security_group_identifier].id
}
