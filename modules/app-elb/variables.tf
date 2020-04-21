#aws_acm_certificate.certificate
variable "hosted_zone_name" {
    description = "A domain name for which the certificate should be issued"
}
#aws_lb.application-loadbalancer
variable "name_prefix" {
    description = "The name of the LB"
}
variable "lb_internal" {
    default = false
    description = "If true, the LB will be internal"
}
variable "lb_type" {
    default = "application"
    description = "The type of load balancer to create"
}
variable "public1_subnet_id" {
    description = "subnet ID to attach to the LB"
}
variable "public2_subnet_id" {
    description = "subnet ID to attach to the LB"
}
variable "security_groups" {
    description = "A list of security group IDs to assign to the LB"
}
variable "enable_del_protection" {
    default = false
    description = "If true, deletion of the load balancer will be disabled via the AWS API"
}
#aws_lb_target_group.app_lb_tgt_atscaling
variable "target_group_port" {
    default = 5000
    description = "The port on which targets receive traffic"
}
variable "target_group_protocol" {
    default = "HTTP"
    description = "The protocol to use for routing traffic to the targets"   
}
variable "vpc_id" {
    description = "The identifier of the VPC in which to create the target group"
}
variable "health_check_protocol" {
    default = "HTTP"
    description = "The protocol to use to connect with the target"
}
variable "health_check_path" {
    default = "/api/status"
    description = "The destination for the health check request"
}
variable "healthy_threshold" {
    default = 3 
    description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}
variable "unhealthy_threshold" {
    default = 10
    description = "The number of consecutive health check failures required before considering the target unhealthy"
}
variable "health_check_timeout" {
    default = 5
    description = "The amount of time, in seconds, during which no response means a failed health check"
}
variable "health_check_interval" {
    default = 10
    description = "The approximate amount of time, in seconds, between health checks of an individual target"
}
#aws_route53_record.backend-dns-record
variable "zone_id" {
    description = "The ID of the hosted zone to contain this record"
}
variable "record_type" {
    default = "CNAME"
    description = "The record type"
}
variable "record_ttl" {
    default = 300
    description = "The TTL of the record"
}
