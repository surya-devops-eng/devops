# Day 12: Advanced Terraform - Remote State, Workspaces & Modules Lab

Hands-on practical exploration of Terraform child module encapsulation, Terraform Workspaces CLI operations, and state inspection commands.

## Core Concepts Implemented
- **Module Design Pattern:** Created a reusable `./modules/static_site` child module with isolated input variables and exported outputs.
- **Dynamic Workspaces:** Leveraged `terraform.workspace` contextual metadata to switch deployment rings dynamically.
- **State Management:** Tested state inspection commands (`terraform state list`, `terraform state show`).

## Verification Workflow
```bash
# 1. Initialize workspace
terraform init

# 2. Test default workspace execution
terraform plan -out=tfplan
terraform apply -auto-approve tfplan

# 3. Create and switch to staging workspace
terraform workspace new staging
terraform plan -out=tfplan
terraform apply -auto-approve tfplan

# 4. Inspect active state
terraform state list
terraform output

# 5. Clean up workspace resources
terraform destroy -auto-approve
terraform workspace select default
terraform workspace delete staging
