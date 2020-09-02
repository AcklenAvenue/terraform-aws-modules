provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.aws_region
}

resource "aws_launch_configuration" "review" {
  name_prefix                 = var.name
  image_id                    = "ami-0bcc094591f354be2"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = false

  security_groups = [
    data.aws_security_group.ssh.id,
    data.aws_security_group.consul.id
  ]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = var.name
  launch_configuration = aws_launch_configuration.review.name
  min_size             = 1
  max_size             = 2
  force_delete         = true

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

resource "aws_autoscaling_schedule" "schedule_turnoff" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "ShutDown-Mon-Friday"
  recurrence             = "0 0 * * 2-6" #2020-03-09 00:00:00 UTC - 18:00:00
  min_size               = 0
  desired_capacity       = 0
  max_size               = 0
}

resource "aws_autoscaling_schedule" "schedule_turnon" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  scheduled_action_name  = "TurnOn-Mon-Friday"
  recurrence             = "30 12 * * 2-6" #e.g 2020-03-09 12:30:00 UTC - 06:30:00
  min_size               = 1
  desired_capacity       = 1
  max_size               = 2
}
