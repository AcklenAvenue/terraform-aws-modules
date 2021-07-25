resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.name
  retention_in_days = 3
  tags = {
    Name    = var.name
    Project = var.project
  }
}

resource "aws_cloudwatch_log_stream" "logstream" {
  name           = var.name
  log_group_name = aws_cloudwatch_log_group.log_group.name
}