module "loadbalancer" {
  source  = "AcklenAvenue/modules/aws//modules/loadbalancer"
  version = "0.0.5"

  project        = var.project
  environment    = var.environment
  version_string = var.version_string
  domain         = var.domain
  vpc_id         = module.network.vpc_id

  subnets = [
    module.network.public_subnets_ids["public-network-1"],
    module.network.public_subnets_ids["public-network-2"]
  ]

  security_groups = [
    module.network.security_group_ids["loadbalancer"]
  ]

  target_groups = [
    {
      name                = "nginx"
      protocol            = "HTTP"
      port                = 80
      path                = "/"
      healthcheck_path    = "/"
      healthcheck_port    = 80
      healthy_threshold   = 3
      unhealthy_threshold = 10
      timeout             = 5
      interval            = 10
      matcher             = 200
    },
    {
      name                = "consul"
      protocol            = "HTTP"
      port                = 8085
      path                = "/consul"
      healthcheck_path    = "/"
      healthcheck_port    = 8085
      healthy_threshold   = 3
      unhealthy_threshold = 10
      timeout             = 5
      interval            = 10
      matcher             = 200
    }
  ]
}
