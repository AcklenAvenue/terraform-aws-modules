locals {
  name_prefix = "consul-server-${var.project}-${var.environment}-${var.version_string}"

  tags = {
    Project     = var.project
    Environment = var.environment
    Version     = var.version_string
  }
}
