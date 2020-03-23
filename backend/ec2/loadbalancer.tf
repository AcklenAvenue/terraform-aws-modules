#------------ load balancer ------------
data "aws_acm_certificate" "certificate" {
  domain   = "*.${var.hosted_zone_name}"
  statuses = ["ISSUED"]
}

resource "aws_elb" "sprint0_elb" {
  name = "${var.name_prefix}-elb1"

  subnets = [
    var.public1_subnet_id,
    var.public2_subnet_id,
  ]

  security_groups = var.sprint0_public_sg

  dynamic "listener" {
    for_each = var.listeners
    content {
      instance_port      = listener.value.instance_port
      instance_protocol  = listener.value.instance_protocol
      lb_port            = listener.value.lb_port
      lb_protocol        = listener.value.lb_protocol
      ssl_certificate_id = (listener.value.lb_protocol == "https") ? data.aws_acm_certificate.certificate.arn : ""
    }
  }

  health_check {
    healthy_threshold   = var.elb_healthy_threshold
    unhealthy_threshold = var.elb_unhealthy_threshold
    timeout             = var.elb_timeout
    target              = var.elb_target
    interval            = var.elb_interval
  }

  cross_zone_load_balancing   = var.cross_zone_lb
  idle_timeout                = var.idle_timeout
  connection_draining         = var.con_draining
  connection_draining_timeout = var.con_draining_timeout

  instances = [
    aws_instance.ec2-first.id,
    aws_instance.ec2-second.id,
  ]

  tags = {
    Name = "${var.name_prefix}-elb"
  }
}

resource "aws_route53_record" "backend-dns-record" {
  zone_id = var.zone_id
  name    = "${var.name_prefix}.${var.hosted_zone_name}"
  type    = var.record_type
  ttl     = var.record_ttl
  records = [aws_elb.sprint0_elb.dns_name]
}
