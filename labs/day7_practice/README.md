# Day 7: Kubernetes Architecture & Primitives Lab

Hands-on exploration of Kubernetes control plane mechanics, worker node components, and core workload/service abstractions.

## Architecture Core
- **Control Plane:** `kube-apiserver`, `etcd`, `kube-scheduler`, `kube-controller-manager`.
- **Worker Node:** `kubelet`, `kube-proxy`, Container Runtime (`containerd`).
- **Primitives:** Pods, ReplicaSets, Deployments (Rolling Updates, Liveness/Readiness Probes), ClusterIP Services.

## Verification & Deployment Commands
```bash
# Apply declarative manifests
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Inspect resources and status
kubectl get deployments,replicasets,pods,services -o wide
kubectl describe pod -l app=k8s-demo
