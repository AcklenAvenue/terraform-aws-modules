resource "aws_launch_template" "launch_configuration" {
  name                    = local.name_prefix
  description             = "Launche template for ${local.name_prefix}"
  image_id                = data.aws_ami.consul.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  target_group_arns       = var.target_group_arns
  update_default_version  = true
  disable_api_termination = false

  iam_instance_profile {
    arn = aws_iam_instance_profile.instance_profile.arn
  }

  user_data = base64encode(templatefile("${path.module}/files/scripts/user_data.sh", {
    AWS_REGION     = data.aws_region.current.name
    DATACENTER     = replace(local.name_prefix, ".", "-")
    EC2_NAME       = local.name_prefix
    ENCRYPTION_KEY = var.encryption_key
    TAGS = jsonencode([
      for k, v in merge(local.tags, { Name = local.name_prefix }) : {
        Key   = k
        Value = v
      }
    ])
  }))

  network_interfaces {
    description                 = "Network interface for ${local.name_prefix}"
    associate_public_ip_address = true
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
    id      = aws_launch_template.launch_configuration.id
    version = aws_launch_template.launch_configuration.latest_version
  }

  tag {
    key                 = "Name"
    value               = local.name_prefix
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
