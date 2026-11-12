output "service_manifest_paths" {
  value       = { for k, v in local_file.service_manifest : k => v.filename }
  description = "Map of service names to their generated configuration file paths"
}

output "auth_service_rendered_content" {
  value       = jsondecode(data.local_file.read_auth_manifest.content)
  description = "Parsed JSON content verified via Terraform data source"
}
