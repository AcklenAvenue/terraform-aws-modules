data "aws_acm_certificate" "certificate" {
  domain   = "*.${var.hosted_zone_name}"
  statuses = ["ISSUED"]
}

resource "aws_lb" "application-loadbalancer" {
  name               = "${var.name_prefix}-app-lb"
  internal           = var.lb_internal
  load_balancer_type = var.lb_type

  subnets = [
    var.public1_subnet_id,
    var.public2_subnet_id,
  ]

  security_groups = [var.sprint0_public_sg]

  enable_deletion_protection = var.enable_del_protection
  tags = {
    Name = "${var.name_prefix}-elb"
  }
}


resource "aws_lb_listener" "app-lb-listener-443" {
  load_balancer_arn = aws_lb.application-loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tgt_atscaling.arn
  }
}

resource "aws_lb_listener" "app-lb-listener-80" {
  load_balancer_arn = aws_lb.application-loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tgt_atscaling.arn
  }
}

resource "aws_lb_target_group" "app_lb_tgt_atscaling" {
  name     = "${var.name_prefix}-app-tgt-gp"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    protocol            = var.health_check_protocol
    path                = var.health_check_path
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
  }

  tags = {
    Name = "${var.name_prefix}-app-tgt-gp"
  }

}

resource "aws_route53_record" "backend-dns-record" {
  zone_id = var.zone_id
  name    = "${var.name_prefix}.acklenavenueclient.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.application-loadbalancer.dns_name]

}
