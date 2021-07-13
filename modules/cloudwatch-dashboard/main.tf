locals {
  masterObject = {
    "rds" = var.rds_id
    "rdsCluster" = var.rdsCluster_id
    "ecs"         = var.ecs_name
    "cloudfront" = var.cloudfront_id
    "autoscaling" = var.autoscaling_name
  }
  filesObject = {
    "rds" = data.template_file.rds.rendered
    "rdsCluster" = data.template_file.rdsCluster.rendered
    "ecs"         = data.template_file.ecs.rendered
    "cloudfront" = data.template_file.cloudfront.rendered
    "autoscaling" = data.template_file.autoscaling.rendered
  }
  widgets = [for key, value in local.masterObject :
    jsondecode(local.filesObject[key]).widgets
    if value != ""
  ]
}
data "template_file" "cloudwatchDashboard" {
  template = file("${path.module}/dashboards/mainDashboard.json")
  vars = merge(local.masterObject, 
  {
    aws_region  = var.aws_region,
  widgets   = jsonencode(flatten(local.widgets))
  }
  )
}
resource "aws_cloudwatch_dashboard" "wp_site_dashboard" {
  dashboard_name = "${local.name_prefix}-dashboard"

  dashboard_body = data.template_file.cloudwatchDashboard.rendered

}