resource "aws_cloudwatch_log_group" "loggroup" {
  name = "${var.name_prefix}-loggroup"

  tags = {
    Name = "${var.name_prefix}-loggroup"
  }
}

resource "aws_cloudwatch_log_stream" "logstream" {
  name           = var.name_prefix
  log_group_name = aws_cloudwatch_log_group.loggroup.name
}
