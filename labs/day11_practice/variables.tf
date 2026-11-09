variable "environment" {
  type        = string
  default     = "development"
  description = "Target runtime environment (development, staging, production)"
}

variable "app_name" {
  type        = string
  default     = "infra-demo"
  description = "Base application name tag"
}

variable "db_secret_key" {
  type        = string
  default     = "SuperSecretPass123!"
  sensitive   = true
  description = "Sensitive credential string test"
}
