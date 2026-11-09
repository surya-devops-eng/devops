# Day 10: Kubernetes RBAC, Network Policies & Security Hardening Lab

Hands-on practical exploration of least-privilege RBAC definitions, zero-trust NetworkPolicy configuration, and container securityContext hardening.

## Core Concepts Implemented
- **ServiceAccount & RBAC:** Created `pod-reader-sa` bound to a Role with read-only permissions (`get`, `list`, `watch`) on pods.
- **Network Policies:** Implemented a global `default-deny-all` policy paired with explicit `allow-frontend-to-backend` Layer 4 ingress rules.
- **Container Hardening:** Configured `securityContext` enforcing `runAsNonRoot`, `readOnlyRootFilesystem: true`, dropping `ALL` kernel capabilities, and disabling privilege escalation.

## Verification & Validation
```bash
# 1. Test RBAC permissions using auth can-i
kubectl auth can-i list pods --as=system:serviceaccount:default:pod-reader-sa
kubectl auth can-i delete pods --as=system:serviceaccount:default:pod-reader-sa

# 2. Apply manifests
kubectl apply -f serviceaccount.yaml
kubectl apply -f rbac.yaml
kubectl apply -f networkpolicy.yaml
kubectl apply -f hardened-deployment.yaml

# 3. Verify resource creation
kubectl get sa,role,rolebinding,netpol,pods
