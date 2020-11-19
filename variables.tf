#### CLOUDWATCH ####

#cloudwatch_log_group.loggroup
variable "name_prefix" {}
variable "project_name" {}

#### EC2 ####

#instance.sprint0_bastion
variable "dev_instance_type" { default = "t2.micro" }
variable "dev_ami" {}
variable "key_name" {}
#instance.ec2-first
variable "lc_instance_type" {}
#s3_bucket_object.uploadfile
variable "bucket" {}
variable "project" {}
variable "branch" {}
#acm_certificate.certificate
variable "hosted_zone_name" {}
#elb.sprint0_elb
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

#### NETWORK ####

#vpc.sprint0_vpc
variable "vpc_cidr" {}
variable "enable_dns_host" { default = true }
variable "enable_dns_support" { default = true }
#eip.sprint0_eip
variable "eip_vpc" { default = true }
#route_table.sprint0_public_rt
variable "rt_public_cidr" { default = "0.0.0.0/0" }
#default_route_table.sprint0_private_rt
variable "rt_private_cidr" { default = "0.0.0.0/0" }
#subnet.sprint0_public1_subnet
variable "public_ip_map" { default = true }
#subnet.sprint0_private1_subnet
variable "private_ip_map" { default = false }
#subnet.sprint0_rds1_subnet
variable "rds_ip_map" { default = false }

data "aws_availability_zones" "available" {}

#### RDS ####

#db_snapshot.db_snapshot
variable "most_recent" { default = true }
variable "db_snapshot_name" {}
#db_instance.db_uat
variable "db_instance_type" { default = "db.t2.micro" }
variable "db_username" {}
variable "db_password" {}
variable "db_subnet_group_name" {}
variable "vpc_security_group_ids" {}
variable "db_skip_final_snap" { default = true }
variable "db_public_access" { default = true }

#### SECURITY ####

#security_group.sprint0_bastion_sg
variable "bastion_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_public_sg
variable "public_sg_ingress" {
  type = list(
    object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
  )
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
variable "public_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_private_sg
variable "private_ingress_cidr" {}
variable "private_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_rds_sg
variable "db_port" {}
