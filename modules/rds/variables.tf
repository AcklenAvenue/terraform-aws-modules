#db_snapshot.db_snapshot
variable "most_recent" { default = true }
variable "db_snapshot_name" {}
#db_instance.db_uat
variable "db_instance_type" { default = "db.t2.micro" }
variable "name_prefix" {}
variable "db_username" {}
variable "db_password" {}
variable "db_subnet_group_name" {}
variable "vpc_security_group_ids" {}
variable "db_skip_final_snap" { default = true }
variable "db_public_access" { default = true }
#route53_record.dns_record
variable "zone_id" {}
variable "hosted_zone_name" {}
variable "record_type" { default = "CNAME" }
variable "record_ttl" { default = 300 }
