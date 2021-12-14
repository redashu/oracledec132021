# Docker & Adv K8s

## Expectations 

<img src="exp.png">

### Plan 

<img src="plan.png">

### content 

<img src="content.png">

## Registry 

<img src="reg.png">

### opensource options to host docker registry 

[REgistry](https://goharbor.io/)

### Image name reality 

```
docker pull oraclelinux:8.4        
8.4: Pulling from library/oraclelinux
a4df6f21af84: Pull complete 
Digest: sha256:b81d5b0638bb67030b207d28586d0e714a811cc612396dbe3410db406998b3ad
Status: Downloaded newer image for oraclelinux:8.4
docker.io/library/oraclelinux:8.4

```

### pulling image from other registry 

```
docker pull quay.io/bitnami/nginx

```

## pushing image to docker hub 

### step 1 tagging 

```
docker  tag  ashuhttpd:dec13app1   docker.io/dockerashu/ashuimages:dec14v1 
```

### step 2 login 

```
docker login  
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: dockerashu
Password: 
Login Succeeded

```

### step 3 

```
docker push  docker.io/dockerashu/ashuimages:dec14v1
The push refers to repository [docker.io/dockerashu/ashuimages]
afabf63ee6a0: Pushed 
62e999172f36: Pushed 
c029303805d7: Mounted from library/oraclelinux 
dec14v1: digest: sha256:0fa34296d50a47b827b768c44eaf9c17344704f8d6e44014da51d8b271f511c1 size: 952
```

### step 4 (optional)

```
docker logout 
Removing login credentials for https://index.docker.io/v1/
```


## ANy one can pull this public repo image 

```
docker pull dockerashu/ashuimages:dec14v1

dec14v1: Pulling from dockerashu/ashuimages
b791d4160c6a: Already exists 
096f3738e919: Downloading [>                                                  ]  1.063MB/115.8MB
cf87065a7d2e: Downloading [=============>                                     ]  128.9kB/480.3kB

```

## Pushing image to OCR 


### tagging 

```
docker  tag  ashuhttpd:dec13app1   phx.ocir.io/axmbtg8judkl/httpdapp:v1
```

### login 

```
docker login  phx.ocir.io   
Username: axmbtg8judkl/learntechbyme@gmail.com
Password: 
Login Succeeded


```

### pushing image

```
docker push  phx.ocir.io/axmbtg8judkl/httpdapp:v1
The push refers to repository [phx.ocir.io/axmbtg8judkl/httpdapp]
afabf63ee6a0: Pushed 
62e999172f36: Pushing [==========================================>        ]    140MB/163.1MB
c029303805d7: Pu
```

### optional step 

```
docker  logout   phx.ocir.io
Removing login credentials for phx.ocir.io

```



