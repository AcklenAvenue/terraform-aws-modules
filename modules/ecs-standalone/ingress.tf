module "ingress" {
  source  = "AcklenAvenue/modules/aws//modules/nginx-ingress"
  version = "0.0.5"

  project            = var.project
  environment        = var.environment
  version_string     = var.version_string
  cluster_id         = module.ecs.cluster_id
  cluster_name       = module.ecs.cluster_name
  consul_datacenter  = replace("consul-server-${var.project}-${var.environment}-${var.version_string}", ".", "-")
  consul_cluster_tag = "consul-server-${local.name_prefix}"
  encryption_key     = var.consul["encryption_key"]
  log_group          = module.ecs.log_group
  target_group_arn   = module.loadbalancer.target_group_arns["nginx"]
}
