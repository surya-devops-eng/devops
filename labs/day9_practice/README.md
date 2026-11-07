# Day 9: Kubernetes Ingress, Helm & Autoscaling (HPA) Lab

Hands-on exploration of Layer 7 traffic routing, Helm package management, and dynamic autoscaling via HPA.

## Core Topics
- **Ingress Controller:** Layer 7 HTTP path matching and host-based virtual hosting (`demo.local`).
- **Helm:** Parameterizing Kubernetes deployments via `Chart.yaml` and `values.yaml`.
- **HPA:** Autoscaling replica count (min: 2, max: 10) targeting 50% average CPU utilization.

## Verification & Testing
```bash
# 1. Apply Kubernetes manifests manually
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
kubectl apply -f hpa.yaml

# 2. Test Helm rendering dry-run
helm template day9-release . --values values.yaml

# 3. Inspect HPA autoscaling status
kubectl get hpa app-hpa
