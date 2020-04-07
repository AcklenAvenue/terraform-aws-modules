output "classic_lb_name" {
  description = "Classic load balancer name"
  value       = aws_elb.sprint0_elb.name
}