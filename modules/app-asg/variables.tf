#aws_launch_configuration.launchconfiguration
variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
}
variable "image_id" {
  description = "The EC2 image ID to launch"
}
variable "lc_instance_type" {
  description = "The size of instance to launch"
}
variable "key_name" {
  description = "The key name that should be used for the instance"
}
variable "security_groups" {
  description = "A list of associated security group IDS"
}
#aws_autoscaling_group.autoscaling-project
variable "min_size_asg" {
  description = "The minimum size of the auto scale group"
}
variable "max_size_asg" {
  description = "The maximum size of the auto scale group"
}
variable "health_check_grace_period" {
  default     = 300
  description = "Time (in seconds) after instance comes into service before checking health"
}
variable "health_check_type" {
  description = "'EC2' or 'ELB'. Controls how health checking is done"
}
variable "app_lb_tgt_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application or Network Load Balancing"
}
variable "force_delete" {
  default     = true
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
}
variable "private1_subnet_id" {
  description = "subnet ID to launch resources in"
}
variable "private2_subnet_id" {
  description = "subnet ID to launch resources in"
}
#aws_autoscaling_schedule.schedule-turnoff
variable "turnoff_scheduled_action" {
  default     = "Shutdown-Mon-Friday"
  description = "The name of this scaling action"
}
variable "turnoff_recurrence" {
  default     = "0 0 * * 2-6"
  description = "The time when recurring future actions will start"
}
variable "turnoff_min_size" {
  default     = 0
  description = "The minimum size for the Auto Scaling group"
}
variable "turnoff_max_size" {
  description = "The maximum size for the Auto Scaling group"
}
variable "turnoff_desired_capacity" {
  default     = 0
  description = "The number of EC2 instances that should be running in the group"
}
#aws_autoscaling_schedule.schedule-turnon
variable "turnon_scheduled_action" {
  default     = "Turn on-Mon-Friday"
  description = "The name of this scaling action"
}
variable "turnon_recurrence" {
  default     = "30 12 * * 2-6"
  description = "The time when recurring future actions will start"
}
variable "turnon_min_size" {
  description = "The minimum size for the Auto Scaling group"
}
variable "turnon_max_size" {
  description = "The maximum size for the Auto Scaling group"
}
variable "turnon_desired_capacity" {
  default     = 2
  description = "The number of EC2 instances that should be running in the group"
}