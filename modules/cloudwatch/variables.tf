#cloudwatch_log_group.loggroup
variable "name_prefix" {
    description = "The name of the log group"
}
variable "project_name" {
		description = "Sets the project name for resources"
}
variable "retention_days" {
    default = 3
    description = "Specifies the number of days you want to retain log events in the specified log group"    
}
