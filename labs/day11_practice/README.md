# Day 11: Infrastructure as Code (IaC) with Terraform Fundamentals Lab

Practical lab demonstrating core Terraform mechanics: Provider initialization, HCL variables/locals/outputs, DAG resource dependency creation, and local state management.

## Core Concepts Explored
- **Providers & Plugins:** Initialization using `hashicorp/local` and `hashicorp/random`.
- **HCL Structure:** Separation of variables, locals, outputs, and resources.
- **Sensitive Variables:** Suppression of sensitive credentials (`db_secret_key`) in CLI outputs.
- **State Hygiene:** Enforcing state exclusion (`.tfstate`) in `.gitignore`.

## Practical Execution Workflow
```bash
# 1. Initialize workspace and download provider plugins
terraform init

# 2. Validate HCL syntax and format code
terraform fmt
terraform validate

# 3. Create execution plan
terraform plan -out=tfplan

# 4. Apply configuration to provision resources
terraform apply tfplan

# 5. Inspect generated state and outputs
terraform state list
terraform output

# 6. Clean up provisioned resources
terraform destroy -auto-approve
