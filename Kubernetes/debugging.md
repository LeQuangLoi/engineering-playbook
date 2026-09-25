# Logs and Debugging

```bash
kubectl logs <pod-name> -n <namespace>
kubectl logs <pod-name> --previous
kubectl logs <pod-name> -c <container-name>
kubectl logs -n keda <keda-operator-pod>
kubectl exec -it <pod-name> -n <namespace> -- printenv
kubectl exec -it <pod-name> -- redis-cli
kubectl exec -it <pod-name> -- cat /mnt/secrets-store/<file>
```

Use the least-privileged command that answers the diagnostic question. Avoid exposing secret values in terminal output or shared logs.
