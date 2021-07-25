resource "aws_route53_record" "loadbalancer" {
  zone_id = data.aws_route53_zone.zone.id
  name    = "${var.name}.${var.domain}"
  type    = "A"

  alias {
    name                   = aws_lb.loadbalancer.dns_name
    zone_id                = aws_lb.loadbalancer.zone_id
    evaluate_target_health = "false"
  }
}

resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.zone.id
  name    = "${var.name}-bastion.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [
    aws_instance.bastion.public_ip
  ]
}
