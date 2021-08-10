resource "aws_lb" "loadbalancer" {
  name                       = var.name
  load_balancer_type         = "application"
  enable_deletion_protection = false
  internal                   = false
  security_groups            = [aws_security_group.loadbalancer.id]

  subnets = [
    module.network.public1_subnet_id,
    module.network.public2_subnet_id
  ]

  tags = {
    Name    = var.name
    Project = var.project
  }
}

resource "aws_lb_target_group" "nginx" {
  name     = "${var.name}-nginx"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/status"
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
  }

  tags = {
    Name    = "${var.name}-nginx"
    Project = var.project
  }

  depends_on = [aws_lb.loadbalancer]
}

resource "aws_lb_listener" "listener_80" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "listener_443" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}

resource "aws_lb_target_group_attachment" "bastion" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.bastion.id
  port             = 80
}
