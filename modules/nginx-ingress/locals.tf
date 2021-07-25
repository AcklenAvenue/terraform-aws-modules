locals {
  name_prefix = "${var.project}-${var.environment}-${var.version_string}"

  tags = {
    Project     = var.project
    Environment = var.environment
    Version     = var.version_string
  }
}
