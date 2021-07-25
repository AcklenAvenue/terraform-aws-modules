module "consul_cluster" {
  source  = "AcklenAvenue/modules/aws//modules/consul"
  version = "0.0.5"

  project          = var.project
  environment      = var.environment
  version_string   = var.version_string
  consul_version   = var.consul["consul_version"]
  key_name         = var.consul["key_name"]
  instance_type    = var.consul["instance_type"]
  min_size         = var.consul["min_size"]
  desired_capacity = var.consul["desired_capacity"]
  max_size         = var.consul["max_size"]
  encryption_key   = var.consul["encryption_key"]

  subnet_ids = [
    module.network.public_subnets_ids["public-network-1"],
    module.network.public_subnets_ids["public-network-2"]
  ]

  target_group_arns = [
    module.loadbalancer.target_group_arns["consul"]
  ]

  security_group_ids = [
    module.network.security_group_ids["public"],
    module.network.security_group_ids["consul"]
  ]
}
