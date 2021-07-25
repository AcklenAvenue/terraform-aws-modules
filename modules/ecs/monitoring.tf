resource "aws_cloudwatch_log_group" "log_group" {
  name              = local.name_prefix
  retention_in_days = 30

  tags = merge(local.tags, { Name = local.name_prefix })
}
