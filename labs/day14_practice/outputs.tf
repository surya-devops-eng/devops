output "spec_file_path" {
  value       = local_file.service_spec.filename
  description = "Path to the rendered service deployment specification"
}

output "ha_status" {
  value       = var.replica_count >= 2 ? "enabled" : "disabled"
  description = "Indicates whether multi-replica high availability is active"
}
