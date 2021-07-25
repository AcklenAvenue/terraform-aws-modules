output "loadbalancer_dns" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.loadbalancer.dns_name
}

output "loadbalancer_zone_id" {
  description = "The canonical hosted zone ID of the ELB to be used in a Route 53 Alias record"
  value       = aws_lb.loadbalancer.zone_id
}

output "target_group_arns" {
  description = "Target group's ARN filtered by name"
  value = {
    for target_group in aws_lb_target_group.target_groups : trimprefix(target_group.name, "${replace(local.name_prefix, ".", "-")}-") => target_group.arn
  }
}
