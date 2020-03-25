#instance.sprint0_bastion
variable "dev_instance_type" { default = "t2.micro" }
variable "dev_ami" {}
variable "name_prefix" {}
variable "key_name" {}
variable "bastion_sg_id" {}
variable "public1_subnet_id" {}
#instance.ec2-first
variable "lc_instance_type" {}
variable "sprint0_private_sg" {}
variable "private1_subnet_id" {}
#instance.ec2-second
variable "private2_subnet_id" {}
#s3_bucket_object.uploadfile
variable "bucket" {}
variable "project" {}
variable "branch" {}
#acm_certificate.certificate
variable "hosted_zone_name" {}
#elb.sprint0_elb
variable "public2_subnet_id" {}
variable "sprint0_public_sg" {}
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
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    },
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 443
      lb_protocol       = "https"
    }
  ]
}
variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_target" { default = "TCP:5000" }
variable "elb_interval" {}
variable "cross_zone_lb" { default = true }
variable "idle_timeout" { default = 400 }
variable "con_draining" { default = true }
variable "con_draining_timeout" { default = 400 }
#route53_record.backend-dns-record
variable "zone_id" {}
variable "record_type" { default = "CNAME" }
variable "record_ttl" { default = 300 }
