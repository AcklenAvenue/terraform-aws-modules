output "aws_s3_bucket_id" {
  value = aws_s3_bucket.web_bucket.id
}

output "aws_route53_recor_idd" {
  value = aws_route53_record.frontend-alias-dns-record.id
}

output "aws_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend_s3_distribution.id
}