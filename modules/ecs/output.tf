output "cluster_id" {
  description = "ARN that identifies the cluster"
  value = aws_ecs_cluster.cluster.id
}

output "cluster_name" {
  description = "Name of ECS cluster"
  value       = replace(local.name_prefix, ".", "-")
}

output "log_group" {
  description = "AWS Cloudwatch log group for the ECS cluster context"
  value       = aws_cloudwatch_log_group.log_group.name
}