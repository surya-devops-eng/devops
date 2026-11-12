# Day 13: Terraform Meta-Arguments, Lifecycle Rules & Drift Detection Lab

Hands-on exploration of map-keyed `for_each` resource iteration, `lifecycle` hooks, read-only `data` sources, and configuration drift detection.

## Core Concepts Implemented
- **`for_each` Iteration:** Provisioned isolated configuration manifests for `auth`, `billing`, and `notifications` services indexed by map keys.
- **`lifecycle` Management:** Configured `create_before_destroy = true` for safe resource replacement.
- **`data` Source Querying:** Read back generated JSON configuration via `data.local_file`.
- **Drift Detection:** Simulated manual out-of-band file tampering and remediated drift via `terraform plan` and `terraform apply`.

## Verification & Drift Simulation Workflow
```bash
# 1. Initialize, format, and apply infrastructure
terraform init
terraform fmt
terraform validate
terraform apply -auto-approve

# 2. Inspect map-keyed state addresses
terraform state list

# 3. Simulate out-of-band configuration drift
echo '{"tampered": true}' > manifests/auth-config.json

# 4. Detect drift (returns exit code 2 when drift is present)
terraform plan -detailed-exitcode

# 5. Remediate drift back to declarative desired state
terraform apply -auto-approve
