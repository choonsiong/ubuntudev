FROM ubuntu:20.04

# Install packages required
RUN apt-get update && apt-get install -y binutils build-essential sysstat strace vim iputils-ping iproute2 curl wget

# Install Valgrind, (tzdata is installed first to prevent asking for timezone configuration during valgrind installation)
ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
    apt-get install -y tzdata; \
    ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime; \
    apt-get install -y valgrind; \
    apt-get clean
    
# Create directories for bind mount
RUN set -ex; \
    mkdir /root/Playground; \
    mkdir /root/Go

# Install Go
WORKDIR /root/Go
RUN set -ex; \
    wget -c https://golang.org/dl/go1.15.6.linux-amd64.tar.gz -O - | tar -xz; \
    echo "GOROOT=$HOME/Go/go" >> /root/.bashrc; \
    echo "GOPATH=$HOME/Playground/go" >> /root/.bashrc; \
    echo "GOBIN=$HOME/Go/go/bin" >> /root/.bashrc; \
    echo "PATH=$PATH:$HOME/Go/go/bin" >> /root/.bashrc

WORKDIR /root