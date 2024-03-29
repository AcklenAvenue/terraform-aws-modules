data "template_file" "autoscaling" {
  template = file("${path.module}/dashboards/autoscaling.json")
  vars = {
    aws_region       = var.aws_region
    autoscaling_name = var.autoscaling_name
    name_prefix      = local.name_prefix
  }
}

data "template_file" "ecs" {
  template = file("${path.module}/dashboards/ecs.json")

  vars = {
    aws_region  = var.aws_region
    ecs_name    = var.ecs_name
    name_prefix = local.name_prefix
  }

}

data "template_file" "cloudfront" {
  template = file("${path.module}/dashboards/cloudfront.json")

  vars = {
    aws_region    = var.aws_region
    cloudfront_id = var.cloudfront_id
    name_prefix   = local.name_prefix
  }

}

data "template_file" "rds" {
  template = file("${path.module}/dashboards/rds.json")

  vars = {
    aws_region  = var.aws_region
    rds_id      = var.rds_id
    name_prefix = local.name_prefix
  }

}

data "template_file" "rds_cluster" {
  template = file("${path.module}/dashboards/rds_cluster.json")

  vars = {
    aws_region            = var.aws_region
    aurora_rds_cluster_id = var.aurora_rds_cluster_id
    name_prefix           = local.name_prefix
  }

}
