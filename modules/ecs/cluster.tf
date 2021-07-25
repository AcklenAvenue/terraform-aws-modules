resource "aws_ecs_cluster" "cluster" {
  name = replace(local.name_prefix, ".", "-")

  capacity_providers = [
    aws_ecs_capacity_provider.capacity_provider.name
  ]

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = replace(local.name_prefix, ".", "-")

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.autoscaling_group.arn
    managed_termination_protection = "DISABLED"

    managed_scaling {
      status                    = "ENABLED"
      maximum_scaling_step_size = var.max_size
      minimum_scaling_step_size = var.min_size
      target_capacity           = 85
    }
  }

  tags = merge(local.tags, { Name = local.name_prefix })
}
