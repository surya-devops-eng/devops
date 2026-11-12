resource "random_id" "deployment_id" {
  byte_length = 4
}

resource "local_file" "service_spec" {
  filename = "${path.module}/build/${var.environment}-${var.service_name}.json"
  content = jsonencode({
    deployment_id = random_id.deployment_id.hex
    environment   = var.environment
    service       = var.service_name
    replicas      = var.replica_count
    ha_enabled    = var.replica_count >= 2
  })

  lifecycle {
    precondition {
      condition     = var.environment != "prod" || var.replica_count >= 2
      error_message = "High Availability Guard: 'prod' deployments require replica_count >= 2."
    }

    postcondition {
      condition     = self.content_sha256 != ""
      error_message = "Rendered specification file checksum must not be empty."
    }
  }
}

check "staging_ha_advisory" {
  assert {
    condition     = var.environment != "staging" || var.replica_count >= 2
    error_message = "Advisory: Staging environment is running with a single replica."
  }
}
