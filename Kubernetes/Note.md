Kubernetes Quick Ops Note (AKS)
	
	1. Context Switching
		Switch cluster before doing anything.
```bash
	kubectl config get-contexts
	kubectl config use-context <context-name>
```
	2. Pods Monitoring
		Get Pods:
```bash
	kubectl get pods -n <namespace>
	kubectl get pods -n <namespace> -o wide
	kubectl get pods --all-namespaces
```
		Get Pending Pods With Reason:
		Purpose: Monitor workload health.
```bash
	kubectl get pods --all-namespaces  --field-selector=status.phase=Pending  -o custom-columns='NAMESPACE:.metadata.namespace,NAME:.metadata.name,REASON:.status.conditions[-1].reason,MESSAGE:.status.conditions[-1].message'
```
	3. Get Pod Images (Audit ACR Usage)
		Get All Images
```bash
	kubectl get pods --all-namespaces  -o jsonpath="{range .items[*]}{.metadata.namespace}{'\t'}{.metadata.name}{'\t'}{range .spec.containers[*]}{.image}{'\n'}{end}{end}"
```
		Filter by ACR: 
		Purpose: Check deployed images per environment (Dev/UAT/Prod).
```bash
	kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" | Where-Object { $_ -like "crweuuat.azurecr.io/*" }
```
	4. Deployment Management
```bash
	#Scale Deployment
	#Scale to Zero:
	kubectl scale deployment <deployment-name>  -n <namespace> --replicas=0
```
```bash
	#Scale to Specific Replicas:
	#Purpose: Manual scaling or stopping services.
	kubectl scale deployment <deployment-name>  -n <namespace> --replicas=2
```
```bash
	#Restart Deployment:
	#Purpose: Redeploy without changing image (force restart).V
	kubectl rollout restart deployment <deployment-name> -n <namespace>
```
```bash
	#Edit Deployment:
	#Purpose: Modify live deployment configuration.
	kubectl edit deployment <deployment-name> -n <namespace>
```
```bash
	#Delete Deployment / Pod
	#Purpose: Remove workloads.
	kubectl delete deployment <deployment-name> -n <namespace>
	kubectl delete pod <pod-name> -n <namespace>
```
	5. Update Container Image (Release Process)
	   Purpose: Deploy new build version. (You repeated many similar commands — only image/tag/namespace changed.)
```bash
	kubectl set image deployment <deployment-name>  <container-name>=<acr-url>:<tag>  -n <namespace>
```
	6. Apply Configuration
```bash
	kubectl apply -f file.yaml
	kubectl apply --dry-run=client -f file.yaml
```
	7. Logs & Debugging		
```bash
	#Get Logs
	kubectl logs <pod-name> -n <namespace>
	kubectl logs <pod-name> --previous
	kubectl logs <pod-name> -c <container-name>
```		
```bash
	#KEDA Logs
	kubectl logs -n keda <keda-operator-pod>
```
	8. Exec Into Pod
```bash
	kubectl exec -it <pod-name> -n <namespace> -- printenv
	kubectl exec -it <pod-name> -- redis-cli
	kubectl exec -it <pod-name> -- cat /mnt/secrets-store/<file>
```
	9. ConfigMaps & Secrets
```bash	
	#Get:
	kubectl get configmap <name> -n <namespace>
	kubectl get secret <name> -n <namespace>
	kubectl get secret <name> -n <namespace> -o yaml
	#Describe
	kubectl describe configmap <name> -n <namespace>
```
```bash
	#Delete All (Dangerous)
	kubectl delete secret --all -n <namespace>
	kubectl delete svc --all -n <namespace>
```
	10. KEDA (ScaledObject Management)
```bash
	#Get
	kubectl get scaledobject -n <namespace>
	#Edit
	kubectl edit scaledobject <name> -n <namespace>
		
	#Describe
	kubectl describe scaledobject <name> -n <namespace>
	#Delete
	kubectl delete scaledobject <name> -n <namespace>
```
	11. Ingress / Service / Network
```bash
	kubectl get ingress --all-namespaces
	kubectl get ingress -n <namespace>
	kubectl get svc -n <namespace>
	kubectl get networkpolicy -n <namespace>
```
	12. Port Forwarding
	Purpose: Access internal services (Redis, etc.).
```bash 		
	kubectl port-forward <pod-name> 6380:6380 -n <namespace>
```
	13. Azure Container Registry (ACR)
	Purpose: Promote image between ACR environments.
```bash 
	az acr import  --name <target-acr>  --source <source-acr>/<image>:<tag>  --image <image>:<tag>  --force
```
	14. Resource Inspection
	
		Memory Limit
```bash 
	kubectl get pod <pod-name>  -n <namespace>  -o jsonpath="{.spec.containers[0].resources.limits.memory}"
```		
		Cluster Capacity
```bash 
	kube-capacity --sort cpu.limit --pods
```
	15. Health / External Check
	Purpose: Simulate monitoring tool (Pingdom).
```bash 
	curl -I -A "Pingdom.com_bot_version_1.4_(http://www.pingdom.com/)" https://your-url
```