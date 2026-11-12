run "valid_dev_deployment_plan" {
  command = plan

  variables {
    environment   = "dev"
    service_name  = "payment-gateway"
    replica_count = 1
  }

  assert {
    condition     = endswith(local_file.service_spec.filename, "/build/dev-payment-gateway.json")
    error_message = "Expected spec filename to follow <env>-<service>.json convention."
  }

  assert {
    condition     = output.ha_status == "disabled"
    error_message = "Expected ha_status output to be 'disabled' when replica_count is 1."
  }
}

run "valid_prod_ha_deployment_plan" {
  command = plan

  variables {
    environment   = "prod"
    service_name  = "payment-gateway"
    replica_count = 3
  }

  assert {
    condition     = output.ha_status == "enabled"
    error_message = "Expected ha_status output to be 'enabled' for multi-replica prod deployment."
  }
}

run "reject_unknown_environment" {
  command = plan

  variables {
    environment   = "sandbox"
    service_name  = "payment-gateway"
    replica_count = 1
  }

  expect_failures = [
    var.environment,
  ]
}

run "reject_uppercase_service_name" {
  command = plan

  variables {
    environment   = "dev"
    service_name  = "Payment_Service"
    replica_count = 1
  }

  expect_failures = [
    var.service_name,
  ]
}

run "enforce_prod_ha_precondition" {
  command = plan

  variables {
    environment   = "prod"
    service_name  = "payment-gateway"
    replica_count = 1
  }

  expect_failures = [
    local_file.service_spec,
  ]
}
