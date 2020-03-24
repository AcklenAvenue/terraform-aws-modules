resource "aws_route53_record" "dns-record" {
  zone_id = var.zone_id
  name    = "${var.name_prefix}-db.${var.hosted_zone_name}"
  type    = var.record_type
  ttl     = var.record_ttl
  records = [aws_db_instance.db_uat.address]
}
