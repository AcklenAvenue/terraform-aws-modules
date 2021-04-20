locals {
  name_prefix = "${var.project}-${var.environment}-${var.version_string}"

  tags = {
    Project     = var.project
    Environment = var.environment
    Version     = var.version_string
  }

  ingress_map = zipmap(var.security_groups[*].name, var.security_groups[*].ingress)
  ingress = flatten([
    for security_group_name, security_group in local.ingress_map : [
      for rule in security_group : {

        security_group_identifier = (
          rule.security_group != null ?
          "ingress-${security_group_name}-${rule.security_group}-${rule.from_port}-${rule.protocol}" :
          "ingress-${security_group_name}-${rule.from_port}-${rule.protocol}"
        )

        security_group_name = security_group_name
        cidr_blocks         = rule.cidr_blocks
        from_port           = rule.from_port
        to_port             = rule.to_port
        protocol            = rule.protocol
        security_group      = rule.security_group
      }
    ]
  ])

  egress_map = zipmap(var.security_groups[*].name, var.security_groups[*].egress)
  egress = flatten([
    for security_group_name, security_group in local.egress_map : [
      for rule in security_group : {

        security_group_identifier = (
          rule.security_group != null ?
          "egress-${security_group_name}-${rule.security_group}-${rule.from_port}-${rule.protocol}" :
          "egress-${security_group_name}-${rule.from_port}-${rule.protocol}"
        )

        security_group_name = security_group_name
        cidr_blocks         = rule.cidr_blocks
        from_port           = rule.from_port
        to_port             = rule.to_port
        protocol            = rule.protocol
        security_group      = rule.security_group
      }
    ]
  ])

  nat_gateways_configuration = flatten([
    for i, mapping in var.natgateway_mapping : [
      for j, private_subnet in mapping.private_subnets : {
        id             = "${mapping.public_subnet}-${private_subnet}"
        public_subnet  = mapping.public_subnet
        private_subnet = private_subnet
      }
    ]
  ])
}
