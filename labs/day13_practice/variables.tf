variable "services" {
  type = map(object({
    port     = number
    replicas = number
    tier     = string
  }))
  default = {
    auth = {
      port     = 8081
      replicas = 2
      tier     = "critical"
    }
    billing = {
      port     = 8082
      replicas = 3
      tier     = "critical"
    }
    notifications = {
      port     = 8083
      replicas = 1
      tier     = "standard"
    }
  }
  description = "Map of microservices provisioned via for_each"
}
