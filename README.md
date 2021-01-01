# Notes

### To run the container using downloaded image

Run the container with `$ docker pull choonsiong/ubuntudev`

```
 18:20:29 364  docker pull choonsiong/ubuntudev
Using default tag: latest
latest: Pulling from choonsiong/ubuntudev
da7391352a9b: Already exists 
14428a6d4bcd: Already exists 
2c2d948710f2: Already exists 
84e70e44a70f: Pull complete 
f03814e4619a: Pull complete 
43c3ff7db49d: Pull complete 
e392360c6c26: Pull complete 
b03c4e804f75: Pull complete 
c77e08b33660: Pull complete 
dee6217ca994: Pull complete 
87d48e587ff6: Pull complete 
d12dc0883327: Pull complete 
f86c57918e82: Pull complete 
edcf0520aded: Pull complete 
Digest: sha256:9456f5dfc3f59b2e19a88245e91d9b38252eaf5f053a680ff2e7b812ed5e1261
Status: Downloaded newer image for choonsiong/ubuntudev:latest
docker.io/choonsiong/ubuntudev:latest
 18:21:08 364
 18:21:09 364  docker container run -it choonsiong/ubuntudev bash
root@94da9e17ecaf:~# 
root@94da9e17ecaf:~# go version
go version go1.15.6 linux/amd64
root@94da9e17ecaf:~# 
root@94da9e17ecaf:~# valgrind --version
valgrind-3.15.0
root@94da9e17ecaf:~# 
root@94da9e17ecaf:~# gcc
gcc: fatal error: no input files
compilation terminated.
root@94da9e17ecaf:~# 
root@94da9e17ecaf:~# 
```

### To run the container using compose

First clone the git repository.

Start the container with `$ docker-compose run ubuntu bash`

```
 15:02:30 364  docker-compose run ubuntu bash
Creating network "ubuntudev_my_net" with driver "bridge"
Creating ubuntudev_ubuntu_run ... done
root@d4cd038dc1ff:~# 
root@d4cd038dc1ff:~# exit
exit
 15:02:38 364  
 15:02:38 364  docker compose down
The new 'docker compose' command is currently experimental. To provide feedback or request new features please open issues at https://github.com/docker/compose-cli
[+] Running 2/0
 ⠿ Container ubuntudev_ubuntu_run_94ea1c074782  Removed                                                                                                                                                                                                  0.0s
 ⠿ Network "ubuntudev_my_net"                   Removed                                                                                                                                                                                                  0.0s
 15:02:41 364  
```