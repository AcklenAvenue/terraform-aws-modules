output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs.cluster_name
}

output "log_group" {
  description = "ECS log group"
  value = module.ecs.log_group
}
