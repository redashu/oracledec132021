# Docker & Adv K8s

## Expectations 

<img src="exp.png">

### Plan 

<img src="plan.png">

### content 

<img src="content.png">


### app stack in COntainers Now 

<img src="app1.png">

###  hypervisor in world 

<img src="hyper.png">

### Containers in real world 

<img src="containers.png">

### CRE 

<img src="cre.png">

### Docker Installation 

<img src="docker.png">

## Docker Ce setup steps 

### checking linux kernel version 

```
 whoami
root
[root@ip-172-31-82-225 ~]# uname 
Linux
[root@ip-172-31-82-225 ~]# uname  -r 
4.14.252-195.483.amzn2.x86_64
[root@ip-172-31-82-225 ~]# 

```

### Intsalling. docker ce docs 

[docs](https://docs.docker.com/engine/install/)


<img src="install.png">

### RUNC 

<img src="runc.png">

### COnfiguration location of docker CE 

<img src="conf.png">

### Starting docker daemon / service 

```
# systemctl  start  docker  
[root@ip-172-31-82-225 docker]# systemctl  status  docker  
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2021-12-13 06:20:24 UTC; 3s ago
     Docs: https://docs.docker.com
  Process: 2888 ExecStartPre=/usr/libexec/docker/docker-setup-runtimes.sh (code=exited, status=0/SUCCESS)
  Process: 2871 ExecStartPre=/bin/mkdir -p /run/docker (code=exited, status=0/SUCCESS)
 Main PID: 2894 (dockerd)
    Tasks: 8
   Memory: 38.2M


```


### making docker service persistent 

```
 systemctl enable docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.

```


