# Day 14: Terraform Testing, Defensive HCL & CI/CD Automation Lab

Hands-on exploration of shift-left Infrastructure as Code quality gates using custom variable validations, resource `precondition`/`postcondition` hooks, continuous `check` blocks, and the native `terraform test` framework.

## Core Concepts Implemented
- **Custom Variable Validations:** Enforced strict enum boundaries (`dev`, `staging`, `prod`) and regex naming conventions on inputs.
- **Lifecycle Preconditions & Postconditions:** Blocked single-replica production deployments prior to provisioning and verified SHA256 file integrity post-creation.
- **Continuous Check Blocks:** Added non-blocking compliance assertions (`staging_ha_advisory`).
- **Native `terraform test` Suite:** Authored 5 automated unit and negative tests (`tests/service_validation.tftest.hcl`) verifying both valid plans and expected guardrail failures.
- **CI/CD Reference Workflow:** Included `github-actions-ci.yml` demonstrating OIDC-ready automated `fmt`, `validate`, `test`, and `plan` checks.

## Verification Workflow
```bash
# 1. Initialize providers and format HCL
terraform init
terraform fmt -recursive

# 2. Validate configuration syntax
terraform validate

# 3. Execute automated unit & negative test suite
terraform test -verbose

# 4. Verify failure guardrail manually via CLI
terraform plan -var="environment=prod" -var="replica_count=1"
