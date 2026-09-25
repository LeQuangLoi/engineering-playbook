# Deployments and Configuration

## Workflow

```bash
kubectl scale deployment <deployment-name> -n <namespace> --replicas=0
kubectl scale deployment <deployment-name> -n <namespace> --replicas=2
kubectl rollout restart deployment <deployment-name> -n <namespace>
kubectl edit deployment <deployment-name> -n <namespace>
kubectl delete deployment <deployment-name> -n <namespace>
kubectl delete pod <pod-name> -n <namespace>
kubectl set image deployment <deployment-name> <container-name>=<registry>/<image>:<tag> -n <namespace>
kubectl apply -f file.yaml
kubectl apply --dry-run=client -f file.yaml
```

Promote an image between Azure Container Registries:

```bash
az acr import --name <target-acr> --source <source-acr>/<image>:<tag> --image <image>:<tag> --force
```

## Risks

Review the target context and namespace before scaling, replacing images, editing, or deleting resources.
