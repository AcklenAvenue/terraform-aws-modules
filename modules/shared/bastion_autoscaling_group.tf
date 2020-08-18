resource "aws_launch_configuration" "bastion" {
  name                        = var.name
  image_id                    = data.aws_ami.latest_ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  security_groups = [
    aws_security_group.ssh.id,
    aws_security_group.consul.id
  ]

  user_data = templatefile("${path.module}/files/init.sh", {
    AWS_ACCESS_KEY_ID     = var.aws_access_key_id,
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key,
    AWS_REGION            = var.aws_region,
    DATACENTER            = var.name,
    CONSUL_CLUSTER_TAG    = "${var.name}-bastion"
  })
}

resource "aws_autoscaling_group" "bastion" {
  name                 = var.name
  min_size             = var.bastion_min_size
  max_size             = var.bastion_max_size
  desired_capacity     = var.bastion_desired_capacity
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.bastion.name
  termination_policies = ["OldestInstance"]

  vpc_zone_identifier = [
    module.network.public1_subnet_id,
    module.network.public2_subnet_id
  ]

  target_group_arns = [
    aws_lb_target_group.nginx.id,
    aws_lb_target_group.consul.id
  ]

  tags = [
    {
      key                 = "Name"
      value               = "${var.name}-bastion"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = var.name
      propagate_at_launch = true
    }
  ]
}

resource "aws_autoscaling_policy" "cpu_policy" {
  name                      = "${var.name}-cpu"
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = "90"
  adjustment_type           = "ChangeInCapacity"
  autoscaling_group_name    = aws_autoscaling_group.bastion.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}

resource "aws_autoscaling_schedule" "schedule-turnoff" {
  autoscaling_group_name = aws_autoscaling_group.bastion.name
  scheduled_action_name  = "Shutdown-Mon-Friday"
  recurrence             = "0 0 * * 2-6"
  min_size               = 0
  desired_capacity       = 0
  max_size               = 0
}

resource "aws_autoscaling_schedule" "schedule-turnon" {
  autoscaling_group_name = aws_autoscaling_group.bastion.name
  scheduled_action_name  = "Turn on-Mon-Friday"
  recurrence             = "30 12 * * 2-6"
  min_size             = var.bastion_min_size
  desired_capacity     = var.bastion_desired_capacity
  max_size             = var.bastion_max_size
}
