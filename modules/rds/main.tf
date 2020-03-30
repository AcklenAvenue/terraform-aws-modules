data "aws_db_snapshot" "db_snapshot" {
  most_recent            = var.most_recent
  db_instance_identifier = var.db_snapshot_name
}

resource "aws_db_instance" "db_uat" {
  instance_class         = var.db_instance_type
  identifier             = var.name_prefix
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = var.db_subnet_group_name
  snapshot_identifier    = data.aws_db_snapshot.db_snapshot.id
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = var.db_skip_final_snap
  publicly_accessible    = var.db_public_access

  tags = {
    Name = "${var.name_prefix}-rds"
    Project =var.name_prefix
  }
}
