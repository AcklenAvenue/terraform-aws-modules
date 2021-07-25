resource "aws_lb" "loadbalancer" {
  name               = replace(local.name_prefix, ".", "-")
  load_balancer_type = "application"
  internal           = false

  subnets = var.subnets

  security_groups = var.security_groups

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_lb_target_group" "target_groups" {
  for_each = { for r in var.target_groups : r.name => r }

  vpc_id   = var.vpc_id
  name     = "${replace(local.name_prefix, ".", "-")}-${each.value.name}"
  protocol = each.value.protocol
  port     = each.value.port

  health_check {
    protocol            = each.value.protocol
    path                = each.value.healthcheck_path
    port                = each.value.healthcheck_port
    healthy_threshold   = each.value.healthy_threshold
    unhealthy_threshold = each.value.unhealthy_threshold
    timeout             = each.value.timeout
    interval            = each.value.interval
    matcher             = each.value.matcher
  }

  tags = merge(local.tags, { Name = "${local.name_prefix}-${each.value.name}-${each.value.port}" })

  depends_on = [aws_lb.loadbalancer]
}

resource "aws_lb_listener" "listener_443" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.certificate.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener" "listener_80" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = 80
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
