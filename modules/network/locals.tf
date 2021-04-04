locals {
  name_prefix = "${var.project}-${var.environment}"

  ingress_map = zipmap(var.security_groups.*.name, var.security_groups.*.ingress)
  ingress = [
    for security_group_name, security_group in local.ingress_map : [
      for rule in security_group : {
        security_group_identifier = security_group_name
        cidr_blocks               = rule.cidr_blocks
        from_port                 = rule.from_port
        to_port                   = rule.to_port
        protocol                  = rule.protocol
        security_group            = rule.security_group
      }
    ]
  ]

  egress_map = zipmap(var.security_groups.*.name, var.security_groups.*.egress)
  egress = [
    for security_group_name, security_group in local.egress_map : [
      for rule in security_group : {
        security_group_identifier = security_group_name
        cidr_blocks               = rule.cidr_blocks
        from_port                 = rule.from_port
        to_port                   = rule.to_port
        protocol                  = rule.protocol
        security_group            = rule.security_group
      }
    ]
  ]
}


