variable "name_prefix" {}
variable "public1_subnet_id" {}
variable "public2_subnet_id" {}
variable "sprint0_public_sg" {}
variable "vpc_id" {}
variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_interval" {}
variable "zone_id" {}
variable "lb_internal" { default = false }
variable "lb_type" { default = "application" }
variable "enable_del_protection" { default = false }
variable "target_group_port" { default = 5000 }
variable "target_group_protocol" { default = "HTTP" }
variable "health_check_protocol" { default = "HTTP" }
variable "health_check_path" { default = "/api/status" }
variable "healthy_threshold" { default = 3 }
variable "unhealthy_threshold" { default = 10 }
variable "health_check_timeout" { default = 5 }
variable "health_check_interval" { default = 10 }
variable "record_type" { default = "CNAME" }
variable "record_ttl" { default = "300" }
