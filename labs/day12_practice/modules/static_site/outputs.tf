output "manifest_path" {
  value       = local_file.site_manifest.filename
  description = "Generated file path for the site artifact"
}

output "instance_id" {
  value       = random_id.site_id.hex
  description = "Random hex unique key assigned to the module deployment"
}
