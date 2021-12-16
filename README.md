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
 
 ### Task 1 done 
 
 ```
 
 kubectl run  ashutoshhpod1  --image=busybox --command  ping fb.com  --namespace=tasks --dry-run=client -o yaml >task1.yaml 
 kubectl apply -f task1.yaml
 kubectl -n tasks ashutoshhpod1 -- sh
Error: flags cannot be placed before plugin name: -n
 ✘ fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  kubectl -n tasks exec -it  ashutoshhpod1 -- sh 
/ # 
/ # 
/ # ls
bin   dev   etc   home  proc  root  sys   tmp   usr   var
/ # mkdir  /opt
/ # ls
bin   dev   etc   home  opt   proc  root  sys   tmp   usr   var
/ # exit
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  ls
Limitrange.yaml ashupod1.yaml   logs.txt        ocirpod.yaml
ashupod.json    autogen.yaml    new.json        task1.yaml
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  kubectl -n tasks  cp  logs.txt  ashutoshhpod1:/opt/
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8sapps  kubectl -n tasks exec -it  ashutoshhpod1 -- sh / # cd /opt/
/opt # ls
logs.txt
/opt # echo minion2  >>logs.txt 
/opt # cat logs.txt 
PING fb.com (31.13.66.35): 56 data bytes
64 bytes from 31.13.66.35: seq=0 ttl=48 time=0.541 ms
64 bytes from 31.13.66.35: seq=1 ttl=48 time=0.564 ms
64 bytes from 31.13.66.35: seq=2 ttl=48 time=0.620 ms
64 bytes from 31.13.66.35: seq=3 ttl=48 time=0.597 ms
64 bytes from 31.13.66.35: seq=4 ttl=48 time=0.651 ms
64 bytes from 31.13.66.35: seq=5 ttl=48 time=0.568 ms
64 bytes from 31.13.66.35: seq=6 ttl=48 time=0.568 ms
64 bytes from 31.13.66.35: seq=7 ttl=48 time=0.621 ms
64 bytes from 31.13.66.35: seq=8 ttl=48 time=0.844 ms
64 bytes from 31.13.66.35: seq=9 ttl=48 time=0.584 ms
64 bytes from 31.13.66.35: seq=10 ttl=48 time=0.569 ms
64 bytes from 31.13.66.35: seq=11 ttl=48 time=0.580 ms
64 bytes from 31.13.66.35: seq=12 ttl=48 time=0.607 ms
64 bytes from 31.13.66.35: seq=13 ttl=48 time=0.584 ms
64 bytes from 31.13.66.35: seq=14 ttl=48 time=0.597 ms
64 bytes from 31.13.66.35: seq=15 ttl=48 time=0.554 ms
64 bytes from 31.13.66.35: seq=16 ttl=48 time=0.564 ms
64 bytes from 31.13.66.35: seq=17 ttl=48 time=0.563 ms
64 bytes from 31.13.66.35: seq=18 ttl=48 time=0.568 ms
64 bytes from 31.13.66.35: seq=19 ttl=48 time=0.605 ms
64 bytes from 31.13.66.35: seq=20 ttl=48 time=0.569 ms
64 bytes from 31.13.66.35: seq=21 ttl=48 time=0.568 ms
64 bytes from 31.13.66.35: seq=22 ttl=48 time=0.556 ms
64 bytes from 31.13.66.35: seq=23 ttl=48 time=0.599 ms
64 bytes from 31.13.66.35: seq=24 ttl=48 time=0.619 ms
64 bytes from 31.13.66.35: seq=25 ttl=48 time=0.565 ms
64 bytes from 31.13.66.35: seq=26 ttl=48 time=0.553 ms
64 bytes from 31.13.66.35: seq=27 ttl=48 time=0.566 ms
64 bytes from 31.13.66.35: seq=28 ttl=48 time=0.600 ms
64 bytes from 31.13.66.35: seq=29 ttl=48 time=0.557 ms
64 bytes from 31.13.66.35: seq=30 ttl=48 time=0.549 ms
minion2
/opt # exit

```






