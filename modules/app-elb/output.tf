output "app_lb_tgt_atscaling" {
  description = "Target group arn"
  value       = aws_lb_target_group.app_lb_tgt_atscaling.arn
}