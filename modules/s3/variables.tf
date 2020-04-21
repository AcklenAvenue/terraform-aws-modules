#s3_bucket.web_bucket
variable "name" {
    description = "The name of the bucket"
}
variable "bucket_acl" {
    default = "public-read"
    description = "The canned ACL to apply"
}
variable "bucket_destroy" {
    default = true
    description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
}
variable "index_doc" {
    default = "index.html"
    description = "Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders"
}
#locals
variable "name_prefix" {
    description = "s3 origin name"
}
#route53_record.frontend-alias-dns-record
variable "zone_id" {
    default = "The ID of the hosted zone to contain this record"
}
variable "hosted_zone_name" {
    description = "The name of the hosted zone name"
}
variable "record_type" {
    default = "A"
    description = "The record type"
}
variable "eval_target_health" {
    default = true
    description = "Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set"
}
#cloudfront_distribution.frontend_s3_distribution
variable "cf_distrib_enabled" {
    default = true
    description = "Whether the distribution is enabled to accept end user requests for content"
}
variable "cf_distrib_ipv6" {
    default = true
    description = "Whether the IPv6 is enabled for the distribution"
}
variable "aws_certificate_arn" {
    description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution"
}
