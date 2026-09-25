# Secrets and KEDA

```bash
kubectl get configmap <name> -n <namespace>
kubectl get secret <name> -n <namespace>
kubectl get secret <name> -n <namespace> -o yaml
kubectl describe configmap <name> -n <namespace>
kubectl get scaledobject -n <namespace>
kubectl edit scaledobject <name> -n <namespace>
kubectl describe scaledobject <name> -n <namespace>
kubectl delete scaledobject <name> -n <namespace>
```

Treat these commands as dangerous and verify the namespace first:

```bash
kubectl delete secret --all -n <namespace>
kubectl delete svc --all -n <namespace>
```

Do not paste secret values into notes, issues, or chat.
