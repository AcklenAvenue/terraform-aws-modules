resource "aws_s3_bucket" "web_bucket" {
  bucket        = var.name
  acl           = var.bucket_acl
  force_destroy = var.bucket_destroy

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Allow Public Access to All Objects",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
                  "Resource": "arn:aws:s3:::${var.name}/*"
        }
    ]
}
POLICY

  website {
    index_document = var.index_doc
    error_document = var.error_doc
  }

  tags = {
    Name    = var.name_prefix
    Project = var.project
  }
}

locals {
  s3_origin_id = "${var.name_prefix}-origin"
}

resource "aws_route53_record" "frontend-alias-dns-record" {
  zone_id = var.zone_id
  name    = "${var.name_prefix}-frontend.${var.hosted_zone_name}"
  type    = var.record_type
  alias {
    name                   = aws_cloudfront_distribution.frontend_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.frontend_s3_distribution.hosted_zone_id
    evaluate_target_health = var.eval_target_health
  }

  depends_on = ["aws_cloudfront_distribution.frontend_s3_distribution"]
}

resource "aws_cloudfront_distribution" "frontend_s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.web_bucket.website_endpoint
    origin_id   = local.s3_origin_id

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  aliases = ["${var.name_prefix}-frontend.${var.hosted_zone_name}"]

  enabled             = var.cf_distrib_enabled
  is_ipv6_enabled     = var.cf_distrib_ipv6
  comment             = "${var.name_prefix} cloudfront distro"
  default_root_object = var.index_doc

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "${var.name_prefix}-cloudfront"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.aws_certificate_arn
    ssl_support_method             = "sni-only"
  }
}
