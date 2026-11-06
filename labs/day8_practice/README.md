# Day 8: Kubernetes Configuration, Secrets & Storage Management Lab

Hands-on practical exploration of decoupling application state, securing credentials, and managing dynamic persistent storage in Kubernetes.

## Core Concepts Covered
- **ConfigMaps:** Non-sensitive settings injected via Environment Variables and Volume File Mounts.
- **Secrets:** Base64-encoded credentials injected securely using `stringData` definitions.
- **Persistent Volume Claims (PVC):** Requesting durable `ReadWriteOnce` block storage decoupled from Pod lifecycle events.
- **Volume Projection:** Mounting projected volumes (`/etc/config`) and persistent disk mounts (`/usr/share/nginx/html`).

## Verification Workflow
```bash
# 1. Apply all Kubernetes manifests
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml

# 2. Inspect active resources
kubectl get configmap,secret,pvc,pods

# 3. Verify mounted configuration and secret contents inside running container
POD_NAME=$(kubectl get pods -l app=secure-app -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $POD_NAME -- env | grep -E "APP_ENV|DB_PASSWORD"
kubectl exec -it $POD_NAME -- ls -l /etc/config
cat << 'EOF' > README.md
# Day 8: Kubernetes Configuration, Secrets & Storage Management Lab

Hands-on practical exploration of decoupling application state, securing credentials, and managing dynamic persistent storage in Kubernetes.

## Core Concepts Covered
- **ConfigMaps:** Non-sensitive settings injected via Environment Variables and Volume File Mounts.
- **Secrets:** Base64-encoded credentials injected securely using `stringData` definitions.
- **Persistent Volume Claims (PVC):** Requesting durable `ReadWriteOnce` block storage decoupled from Pod lifecycle events.
- **Volume Projection:** Mounting projected volumes (`/etc/config`) and persistent disk mounts (`/usr/share/nginx/html`).

## Verification Workflow
```bash
# 1. Apply all Kubernetes manifests
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml

# 2. Inspect active resources
kubectl get configmap,secret,pvc,pods

# 3. Verify mounted configuration and secret contents inside running container
POD_NAME=$(kubectl get pods -l app=secure-app -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $POD_NAME -- env | grep -E "APP_ENV|DB_PASSWORD"
kubectl exec -it $POD_NAME -- ls -l /etc/config

cat << 'EOF' > README.md
# Day 8: Kubernetes Configuration, Secrets & Storage Management Lab

Hands-on practical exploration of decoupling application state, securing credentials, and managing dynamic persistent storage in Kubernetes.

## Core Concepts Covered
- **ConfigMaps:** Non-sensitive settings injected via Environment Variables and Volume File Mounts.
- **Secrets:** Base64-encoded credentials injected securely using `stringData` definitions.
- **Persistent Volume Claims (PVC):** Requesting durable `ReadWriteOnce` block storage decoupled from Pod lifecycle events.
- **Volume Projection:** Mounting projected volumes (`/etc/config`) and persistent disk mounts (`/usr/share/nginx/html`).

## Verification Workflow
```bash
# 1. Apply all Kubernetes manifests
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml

# 2. Inspect active resources
kubectl get configmap,secret,pvc,pods

# 3. Verify mounted configuration and secret contents inside running container
POD_NAME=$(kubectl get pods -l app=secure-app -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $POD_NAME -- env | grep -E "APP_ENV|DB_PASSWORD"
kubectl exec -it $POD_NAME -- ls -l /etc/config

clear



```bash
# Navigate to repository root
cd /workspaces/devops

# Stage, commit, sync, and push
git add labs/day8_practice
git commit -m "feat: add day8 kubernetes configmaps, secrets, and persistent volumes lab"
git pull --rebase origin main
git push origin main


cat << 'EOF' > deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: secure-data-app
  namespace: default
  labels:
    app: secure-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: secure-app
  template:
    metadata:
      labels:
        app: secure-app
    spec:
      containers:
      - name: web-app
        image: nginx:alpine
        ports:
        - containerPort: 80
        env:
        - name: APP_ENV
          valueFrom:
            configMapKeyRef:
              name: app-config
              key: APP_ENV
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: app-db-secret
              key: DB_PASS
        volumeMounts:
        - name: config-volume
          mountPath: /etc/config
          readOnly: true
        - name: persistent-storage
          mountPath: /usr/share/nginx/html
      volumes:
      - name: config-volume
        configMap:
          name: app-config
      - name: persistent-storage
        persistentVolumeClaim:
          claimName: app-data-pvc
