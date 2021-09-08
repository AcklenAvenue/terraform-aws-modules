#db_snapshot.db_snapshot
variable "most_recent" {
  default     = true
  description = "If more than one result is returned, use the most recent Snapshot"
}
variable "db_snapshot_name" {
  description = "Returns the list of snapshots created by the specific db_instance"
}
#db_instance.db_uat
variable "db_instance_type" {
  default     = "db.t2.micro"
  description = "The RDS instance class"
}
variable "name_prefix" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}
variable "db_username" {
  description = "Username for the master DB user"
}
variable "db_password" {
  description = "Password for the master DB user"
}
variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
}
variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
}
variable "db_skip_final_snap" {
  default     = true
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
}
variable "db_public_access" {
  default     = true
  description = "Bool to control if instance is publicly accessible"
}
#route53_record.dns_record
variable "zone_id" {
  description = "The ID of the hosted zone to contain this record"
}
variable "hosted_zone_name" {
  description = "A domain name for which the certificate should be issued"
}
variable "record_type" {
  default     = "CNAME"
  description = "The record type"
}
variable "record_ttl" {
  default     = 300
  description = "The TTL of the record"
}