provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key

}

module "network-sprint-0" {
  source      = "./modules/network"
  vpc_cidr    = var.vpc_cidr
  name_prefix = var.name_prefix

  cidrs = {
    public1  = "10.0.1.0/24"
    public2  = "10.0.2.0/24"
    private1 = "10.0.3.0/24"
    private2 = "10.0.4.0/24"
    rds1     = "10.0.5.0/24"
    rds2     = "10.0.6.0/24"
  }
}

module "security-group-sprint0" {
  source               = "./modules/security"
  vpc_id               = module.network-sprint-0.vpc_id
  name_prefix          = var.name_prefix
  allowed_ssh_ip       = ["0.0.0.0/0"]
  private_ingress_cidr = ["${var.vpc_cidr}"]
  db_port              = var.db_port
}

module "cloudwatch" {
  source      = "./modules/cloudwatch"
  name_prefix = var.name_prefix
}

module "ec2-sprint0" {
  source                  = "./modules/ec2"
  dev_instance_type       = var.dev_instance_type
  dev_ami                 = var.dev_ami
  key_name                = var.key_name
  bastion_sg_id           = ["${module.security-group-sprint0.bastion_sg_id}"]
  public1_subnet_id       = module.network-sprint-0.public1_subnet_id
  public2_subnet_id       = module.network-sprint-0.public2_subnet_id
  name_prefix             = var.name_prefix
  sprint0_public_sg       = ["${module.security-group-sprint0.sprint0_public_sg}"]
  elb_healthy_threshold   = var.elb_healthy_threshold
  elb_unhealthy_threshold = var.elb_unhealthy_threshold
  elb_timeout             = var.elb_timeout
  elb_interval            = var.elb_interval
  sprint0_private_sg      = ["${module.security-group-sprint0.sprint0_private_sg}"]
  private1_subnet_id      = module.network-sprint-0.private1_subnet_id
  lc_instance_type        = var.lc_instance_type
  private2_subnet_id      = module.network-sprint-0.private2_subnet_id
  zone_id                 = var.zone_id
  hosted_zone_name        = var.hosted_zone_name
  bucket                  = var.bucket
  project                 = var.project
  branch                  = var.branch
}

# module "rds" {
#   source      = "git::ssh://gitlab.com/ivandres73/terraform-modules.git//backend/modules/rds"
#   db_username = "${var.user}"
#   db_password = "${var.password}"
#   db_subnet_group_name = "${module.network-sprint-0.rds_subnet_group_name}"
#   vpc_security_group_ids = "${module.security-group-sprint0.sprint0_rds_sg}"
#   name_prefix = "${var.name_prefix}"
#   zone_id = "${var.zone_id}"
#   aws_region = "${var.aws_region}"
#   db_instance_type = "db.t2.micro"
#   db_public_access = true
#   db_snapshot_name = "kiwi"
#   bucket = "${var.bucket}"
# }
