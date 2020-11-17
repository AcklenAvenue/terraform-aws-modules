resource "aws_cloudwatch_log_group" "loggroup" {
  name              = "${var.name_prefix}-loggroup"
  retention_in_days = var.retention_days
  tags = {
    Name = "${var.name_prefix}-loggroup"
		Project = var.project_name
  }
}

resource "aws_cloudwatch_log_stream" "logstream" {
  name           = var.name_prefix
  log_group_name = aws_cloudwatch_log_group.loggroup.name
}
