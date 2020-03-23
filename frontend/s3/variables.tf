#s3_bucket.web_bucket
variable "name" {}
variable "bucket_acl" { default = "public-read" }
variable "bucket_destroy" { default = true }
variable "index_doc" { default = "index.html" }
#locals
variable "name_prefix" {}
#route53_record.frontend-alias-dns-record
variable "zone_id" {}
variable "hosted_zone_name" {}
variable "record_type" { default = "A" }
variable "eval_target_health" { default = true }
#cloudfront_distribution.frontend_s3_distribution
variable "cf_distrib_enabled" { default = true }
variable "cf_distrib_ipv6" { default = true }
variable "aws_certificate_arn" {}
