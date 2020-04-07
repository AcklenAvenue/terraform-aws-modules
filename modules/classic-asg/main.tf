resource "aws_launch_configuration" "launchconfiguration" {
  name_prefix     = "${var.name_prefix}-launchconfig"
  image_id        = var.image_id
  instance_type   = var.lc_instance_type
  key_name        = var.key_name
  security_groups = [var.sprint_private_sg]
}

resource "aws_autoscaling_group" "autoscaling-project" {
  name                      = "${var.name_prefix}-auto"
  vpc_zone_identifier       = [var.private1_subnet_id, var.private2_subnet_id]
  launch_configuration      = aws_launch_configuration.launchconfiguration.name
  min_size                  = var.min_size_alb
  max_size                  = var.max_size_alb
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  load_balancers            = [var.classic_lb_name]
  force_delete              = var.force_delete

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
  scheduled_action_name  = var.turnon_scheduled_time
  recurrence             = var.turnon_recurrence
  min_size               = var.turnon_min_size
  max_size               = var.turnon_max_size
  desired_capacity       = var.turnon_min_size
}
