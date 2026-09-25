# Networking and Capacity

```bash
kubectl get ingress --all-namespaces
kubectl get ingress -n <namespace>
kubectl get svc -n <namespace>
kubectl get networkpolicy -n <namespace>
kubectl port-forward <pod-name> 6380:6380 -n <namespace>
kubectl get pod <pod-name> -n <namespace> -o jsonpath="{.spec.containers[0].resources.limits.memory}"
kube-capacity --sort cpu.limit --pods
curl -I -A "Pingdom.com_bot_version_1.4_(http://www.pingdom.com/)" https://<your-url>
```

Confirm the target namespace and service before port forwarding or inspecting production capacity.
