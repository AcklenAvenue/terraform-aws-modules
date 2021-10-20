resource "aws_launch_template" "launch_template" {
  name_prefix             = local.name_prefix
  description             = "Launche template for ${local.name_prefix}"
  image_id                = data.aws_ami.latest_ecs_ami.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  update_default_version  = true
  disable_api_termination = false

  iam_instance_profile {
    arn = aws_iam_instance_profile.ecs.arn
  }

  user_data = var.user_data != null ? var.user_data : base64encode(templatefile("${path.module}/files/scripts/user_data.sh", {
    CLUSTER_NAME = replace(local.name_prefix, ".", "-")
  }))

  network_interfaces {
    description                 = "Network interface for ${local.name_prefix}"
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = var.security_group_ids
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(local.tags, { Name = local.name_prefix })
  }

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                  = local.name_prefix
  min_size              = var.min_size
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  vpc_zone_identifier   = var.subnet_ids
  default_cooldown      = 40
  protect_from_scale_in = false
  target_group_arns     = var.target_group_arns

  termination_policies = [
    "OldestInstance",
    "AllocationStrategy"
  ]

  enabled_metrics = [
    "GroupTotalInstances",
    "GroupInServiceInstances"
  ]

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 90
    }
  }

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }

  tag {
    key                 = "Name"
    value               = local.name_prefix
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = local.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_schedule" "schedule-turnoff" {
  count                  = var.enable_schedule_shutdown ? 1 : 0
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "Shutdown-Schedule"
  recurrence             = var.server_shutdown_cron
  time_zone              = var.server_schedule_timezone
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
}

resource "aws_autoscaling_schedule" "schedule-turnon" {
  count                  = var.enable_schedule_shutdown ? 1 : 0
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "Turn-On-Schedule"
  recurrence             = var.server_turn_on_cron
  time_zone              = var.server_schedule_timezone
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
}
