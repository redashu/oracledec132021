# Docker & Adv K8s

## Expectations 

<img src="exp.png">

### Plan 

<img src="plan.png">

### content 

<img src="content.png">

### Install kubectl link 

[link](https://kubernetes.io/docs/tasks/tools/)

### k8s dashboard Deployment 

[GithubLInk](https://github.com/kubernetes/dashboard)

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
sec

```

### service account bounded with namespace 

<img src="sa.png">

### auth token for k8s dashboard checking 

```
kubectl  get  sa  -n kubernetes-dashboard
NAME                   SECRETS   AGE
default                1         13m
kubernetes-dashboard   1         13m
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  kubectl  get  secret  -n kubernetes-dashboard
NAME                               TYPE                                  DATA   AGE
default-token-m5z5x                kubernetes.io/service-account-token   3      13m
kubernetes-dashboard-certs         Opaque                                0      13m
kubernetes-dashboard-csrf          Opaque                                1      13m
kubernetes-dashboard-key-holder    Opaque                                2      13m
kubernetes-dashboard-token-d6tjk   kubernetes.io/service-account-token   3      13m

```

### changing service type 

```
kubectl edit svc  kubernetes-dashboard  -n kubernetes-dashboard

```
### ROles and clusterrole in k8s 

<img src="role.png">

### give access to sa of kubernetes-dashboard 

```
kubectl  create  clusterrolebinding  defaultsabind  --clusterrole=cluster-admin   --serviceaccount=kubernetes-dashboard:kubernetes-dashbard

```

### Deploy web app 

```
kubectl  create  deployment  ashuweb --image=dockerashu/httpapps:v1  --dry-run=client -o yaml  >web.yaml

```








