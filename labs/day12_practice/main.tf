locals {
  env_name = terraform.workspace == "default" ? "dev" : terraform.workspace
}

module "app_web_service" {
  source      = "./modules/static_site"
  environment = local.env_name
  site_name   = "analytics-portal"
}
