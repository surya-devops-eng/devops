variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment ring (dev, staging, prod)"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Invalid environment: must be 'dev', 'staging', or 'prod'."
  }
}

variable "service_name" {
  type        = string
  default     = "checkout-api"
  description = "Lowercase alphanumeric microservice name with hyphens"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,29}$", var.service_name))
    error_message = "Service name must be 3-30 lowercase alphanumeric characters or hyphens."
  }
}

variable "replica_count" {
  type        = number
  default     = 1
  description = "Number of desired service replicas"

  validation {
    condition     = var.replica_count >= 1 && var.replica_count <= 20
    error_message = "Replica count must be between 1 and 20."
  }
}
