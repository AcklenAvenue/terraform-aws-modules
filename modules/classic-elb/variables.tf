#acm_certificate.certificate
variable "hosted_zone_name" {
  description = "A domain name for which the certificate should be issued"
}
#elb.sprint0_elb
variable "name_prefix" {
  description = "The name of the LB"
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
variable "listeners" {
  type = list(
    object({
      instance_port     = number
      instance_protocol = string
      lb_port           = number
      lb_protocol       = string
    })
  )
  default = [
    {
      instance_port     = 5000
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    },
    {
      instance_port     = 5000
      instance_protocol = "http"
      lb_port           = 443
      lb_protocol       = "https"
    }
  ]
  description = "A list of listener blocks"
}
variable "elb_healthy_threshold" {
  description = "The number of checks before the instance is declared healthy"
}
variable "elb_unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy"
}
variable "elb_timeout" {
  description = "The length of time before the check times out"
}
variable "elb_target" {
  default = "TCP:5000"
  description = "The target of the check"
}
variable "elb_interval" {
  description = "The interval between checks"
}
variable "cross_zone_lb" {
  default = true
  description = "Enable cross-zone load balancing"  
}
variable "idle_timeout" {
  default = 400
  description = "The time in seconds that the connection is allowed to be idle"
}
variable "con_draining" {
  default = true
  description = "Boolean to enable connection draining"
}
variable "con_draining_timeout" {
  default = 400
  description = "The time in seconds to allow for connections to drain"
}
#route53_record.backend-dns-record
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
