# Docker & Adv K8s

## Expectations 

<img src="exp.png">

### Plan 

<img src="plan.png">

### content 

<img src="content.png">

## Deploy app from Private registry 

<img src="pr.png">

### OCIR image pod deploy 

```
kubectl  run  ashupodx1 --image=phx.ocir.io/axmbtg8judkl/alpine:v1   --command  ping localhost  --dry-run=client -o yaml  >ocirpod.yaml
kubectl  get  po
NAME        READY   STATUS             RESTARTS   AGE
ashupodx1   0/1     ImagePullBackOff   0          8m28

```

### Using secret to store Any private registry cred 

<img src="secret.png">

### creating secret 

```
kubectl  create  secret    
Create a secret using specified subcommand.

Available Commands:
  docker-registry Create a secret for use with a Docker registry
  generic         Create a secret from a local file, directory, or literal value
  tls             Create a TLS secret

```

### 

```
kubectl  create  secret docker-registry  ashuimgsec  --docker-server=phx.ocir.io  --docker-username=btg8judkl/learnteme@gmail.com  --docker-password="e+IHrda.sF4[6

```

### list secret
```
kubectl  get  secret
NAME                  TYPE                                  DATA   AGE
ashuimgsec            kubernetes.io/dockerconfigjson        1      63s
default-token-5c6l9   kubernetes.io/service-account-token   3      17h

```

### Deploy POD 

```
kubectl replace -f  ocirpod.yaml --force
pod "ashupodx1" deleted
pod/ashupodx1 replaced
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  kubectl get  po
NAME        READY   STATUS    RESTARTS   AGE
ashupodx1   1/1     Running   0          26s
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  
 
```
 
 





