# Docker & Adv K8s

## Expectations 

<img src="exp.png">

### Plan 

<img src="plan.png">

### content 

<img src="content.png">

## Revision 

<img src="rev.png">

### docker compose 

<img src="compose.png">

## configure Docker engine External storage 

```
 lsblk 
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1       259:0    0    8G  0 disk 
|-nvme0n1p1   259:1    0    8G  0 part /
`-nvme0n1p128 259:2    0    1M  0 part 
nvme1n1       259:3    0  100G  0 disk 
[root@ip-172-31-95-144 docker]# mkfs.xfs /dev/nvme1n1 
meta-data=/dev/nvme1n1           isize=512    agcount=4, agsize=6553600 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=0
data     =                       bsize=4096   blocks=26214400, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=12800, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@ip-172-31-95-144 docker]# mkdir   /mnt/docker 
[root@ip-172-31-95-144 docker]# mount  /dev/nvme1n1   /mnt/docker/
[root@ip-172-31-95-144 docker]# vim /etc/sysconfig/docker
[root@ip-172-31-95-144 docker]# systemctl daemon-reload 
[root@ip-172-31-95-144 docker]# systemctl restart docker 
[root@ip-172-31-95-144 docker]# df -h 
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        3.9G     0  3.9G   0% /dev
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           3.9G  1.2M  3.9G   1% /run
tmpfs           3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/nvme0n1p1  8.0G  2.6G  5.5G  33% /
tmpfs           785M     0  785M   0% /run/user/1001
tmpfs           785M     0  785M   0% /run/user/1000
/dev/nvme1n1    100G  135M  100G   1% /mnt/docker
[root@ip-172-31-95-144 docker]# vim /etc/fstab 
[root@ip-172-31-95-144 docker]# mount -a
[root@ip-172-31-95-144 docker]# cat  /etc/sysconfig/docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=32768:65536 -g  /mnt/docker"

# How many seconds the sysvinit script waits for the pidfile to appear
# when starting the daemon.
DAEMON_PIDFILE_TIMEOUT=10

```





