# Cluster Context and Workloads

## Purpose

Select the correct Kubernetes context and inspect workload health before making changes.

## Workflow

```bash
kubectl config get-contexts
kubectl config use-context <context-name>
kubectl get pods -n <namespace>
kubectl get pods -n <namespace> -o wide
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces --field-selector=status.phase=Pending -o custom-columns='NAMESPACE:.metadata.namespace,NAME:.metadata.name,REASON:.status.conditions[-1].reason,MESSAGE:.status.conditions[-1].message'
```

Inspect deployed images, including Azure Container Registry usage:

```bash
kubectl get pods --all-namespaces -o jsonpath="{range .items[*]}{.metadata.namespace}{'\\t'}{.metadata.name}{'\\t'}{range .spec.containers[*]}{.image}{'\\n'}{end}{end}"
kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" | Where-Object { $_ -like "<registry>.azurecr.io/*" }
```

## Validation

Confirm the active context, namespace, and cluster before using mutating commands.
