provider "aws" {}

terraform {
  backend "s3" {
    region = "us-east-1"
  }
}

resource "aws_launch_configuration" "launchconfiguration" {
  name            = var.name
  image_id        = var.image_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.launch_configuration.id]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = var.name
  launch_configuration = aws_launch_configuration.launchconfiguration.name
  min_size             = 1
  max_size             = 2
  # health_check_grace_period = var.health_check_grace_period
  # health_check_type         = var.health_check_type
  # target_group_arns         = [var.app-lb-tgt-atscaling]
  force_delete = true

  vpc_zone_identifier = [
    data.aws_subnet.private1.id,
    data.aws_subnet.private2.id
  ]

  tags = [
    {
      key                 = "Name"
      value               = var.name
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = var.project
      propagate_at_launch = true
    }
  ]
}

resource "aws_autoscaling_schedule" "schedule-turnoff" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "ShutDown-Mon-Friday"
  recurrence             = "0 0 * * 2-6" #2020-03-09 00:00:00 UTC - 18:00:00
  min_size               = 0
  desired_capacity       = 0
  max_size               = 0
}

resource "aws_autoscaling_schedule" "schedule-turnon" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "TurnOn-Mon-Friday"
  recurrence             = "30 12 * * 2-6" #e.g 2020-03-09 12:30:00 UTC - 06:30:00
  min_size               = 1
  desired_capacity       = 1
  max_size               = 3
}
