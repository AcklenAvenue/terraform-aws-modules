locals {
  master_object = {
    "rds"         = var.rds_id
    "rds_cluster" = var.aurora_rds_cluster_id
    "ecs"         = var.ecs_name
    "cloudfront"  = var.cloudfront_id
    "autoscaling" = var.autoscaling_name
  }

  files_object = {
    "rds"         = data.template_file.rds.rendered
    "rds_cluster" = data.template_file.rds_cluster.rendered
    "ecs"         = data.template_file.ecs.rendered
    "cloudfront"  = data.template_file.cloudfront.rendered
    "autoscaling" = data.template_file.autoscaling.rendered
  }

  widgets = [for key, value in local.master_object :
    jsondecode(local.files_object[key]).widgets
    if value != ""
  ]

}

data "template_file" "cloudwatch_dashboard" {

  template = file("${path.module}/dashboards/main_dashboard.json")

  vars = merge(local.master_object,
    {
      aws_region = var.aws_region,
      widgets    = jsonencode(flatten(local.widgets))
    }
  )

}

resource "aws_cloudwatch_dashboard" "wp_site_dashboard" {
  dashboard_name = "${local.name_prefix}-dashboard"

  dashboard_body = data.template_file.cloudwatch_dashboard.rendered

}
