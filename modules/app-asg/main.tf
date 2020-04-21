resource "aws_launch_configuration" "launchconfiguration" {
  name_prefix     = "${var.name_prefix}-launchconfig"
  image_id        = var.image_id
  instance_type   = var.lc_instance_type
  key_name        = var.key_name
  security_groups = var.security_groups
}

resource "aws_autoscaling_group" "autoscaling-project" {
  name                      = "${var.name_prefix}-auto"
  launch_configuration      = aws_launch_configuration.launchconfiguration.name
  min_size                  = var.min_size_asg
  max_size                  = var.max_size_asg
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  target_group_arns         = var.app_lb_tgt_arns
  force_delete              = var.force_delete
  vpc_zone_identifier = [
    var.private1_subnet_id,
    var.private2_subnet_id
  ]

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-ec2-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "schedule-turnoff" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling-project.name
  scheduled_action_name  = var.turnoff_scheduled_action
  recurrence             = var.turnoff_recurrence
  min_size               = var.turnoff_min_size
  max_size               = var.turnoff_max_size
  desired_capacity       = var.turnoff_desired_capacity
}

resource "aws_autoscaling_schedule" "schedule-turnon" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling-project.name
  scheduled_action_name  = var.turnon_scheduled_action
  recurrence             = var.turnon_recurrence
  min_size               = var.turnon_min_size
  max_size               = var.turnon_max_size
  desired_capacity       = var.turnon_desired_capacity
}
