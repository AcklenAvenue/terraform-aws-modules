module "ecs" {
  source  = "AcklenAvenue/modules/aws//modules/ecs"
  version = "0.0.5"

  project          = var.project
  environment      = var.environment
  version_string   = var.version_string
  instance_type    = "t3.micro"
  key_name         = var.ecs["key_name"]
  min_size         = 1
  desired_capacity = 1
  max_size         = 1
  user_data        = module.ingress.user_data

  subnet_ids = [
    module.network.private_subnets_ids["private-network-1"],
    module.network.private_subnets_ids["private-network-2"]
  ]

  target_group_arns = [
    module.loadbalancer.target_group_arns["nginx"]
  ]

  security_group_ids = [
    module.network.security_group_ids["private"],
    module.network.security_group_ids["consul"]
  ]
}
