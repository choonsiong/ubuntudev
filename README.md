# About

A basic Ubuntu container with packages installed for C and Go development.

> Note:
>
> This repository is link to Docker Hub and is automatically build after `git push`

## To run the container using `docker container run`

> Note:
>
> `~/Root/Playground` is just a directory I use to keep all my programming source code, you can replace it with other directory, but it will still mounted under /root/playground inside the container 😅, you can remove the `-v ...` below if you do not want to bind mount the directory.

Run the command `docker container run -it --name ubuntudev -v ~/Root/Playground:/root/playground choonsiong/ubuntudev`

```
 22:26:51 364  docker container run -it --name ubuntudev -v ~/Root/Playground:/root/playground choonsiong/ubuntudev
Unable to find image 'choonsiong/ubuntudev:latest' locally
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
root@12d6db43dc7c:~#    
root@12d6db43dc7c:~# ls
go  playground
root@12d6db43dc7c:~# 
```

## To start a stop container

First start the container then user the `exec` command to get into the shell.

```
 22:35:43 364  
 22:35:43 364  docker container ls -a
CONTAINER ID   IMAGE                  COMMAND       CREATED         STATUS                     PORTS     NAMES
67ba65e18ca0   choonsiong/ubuntudev   "/bin/bash"   3 minutes ago   Exited (0) 3 minutes ago             ubuntudev
 22:35:47 364  
 22:35:48 364  docker container start ubuntudev
ubuntudev
 22:35:53 364  
 22:37:13 364  docker container ls   
CONTAINER ID   IMAGE                  COMMAND       CREATED         STATUS              PORTS     NAMES
67ba65e18ca0   choonsiong/ubuntudev   "/bin/bash"   4 minutes ago   Up About a minute             ubuntudev
 22:37:16 364  
 22:37:16 364  
 22:37:16 364  
 22:37:17 364  docker container exec -it ubuntudev bash
root@67ba65e18ca0:~# 
root@67ba65e18ca0:~# ls
go  playground
root@67ba65e18ca0:~# 
root@67ba65e18ca0:~# exit
exit
 22:37:29 364   
```

## To run the container using `docker compose`

First clone the git repository, then start the container with `docker-compose run ubuntu bash`

The volume is mounted automatically when using `docker-compose` (you will need to create the local mount point).

This is useful if you do not want to keep the container after using it (`docker compose down` will clean up the created container etc).

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