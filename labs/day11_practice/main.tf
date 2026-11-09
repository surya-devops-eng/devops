resource "random_id" "resource_suffix" {
  byte_length = 4
}

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.app_name
  }
}

resource "local_file" "environment_config" {
  filename = "${path.module}/generated_config_${random_id.resource_suffix.hex}.json"
  content  = jsonencode({
    app_name    = var.app_name
    environment = var.environment
    tags        = local.common_tags
    secret_hash = md5(var.db_secret_key)
  })
}
