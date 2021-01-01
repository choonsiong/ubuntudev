FROM ubuntu:20.04

# Install packages required
RUN apt-get update && apt-get install -y binutils build-essential sysstat strace vim iputils-ping iproute2 curl wget

# Fix the tzdata problem when installing valgrind
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
# RUN dpkg-reconfigure --frontend noninteractive tzdata

# Install valgrind memory debugger
RUN apt-get install -y valgrind

# Create directory for bind mount
RUN mkdir /root/Playground

# Create directory to install Go
RUN mkdir /root/Go

# cd into /root/Go
WORKDIR /root/Go

# Get the Go tar file and unzip
RUN wget -c https://golang.org/dl/go1.15.6.linux-amd64.tar.gz -O - | tar -xz

# Setup environment variables
RUN echo "GOROOT=$HOME/Go/go" >> /root/.bashrc
RUN echo "GOPATH=$HOME/Playground/go" >> /root/.bashrc
RUN echo "GOBIN=$HOME/Go/go/bin" >> /root/.bashrc
RUN echo "PATH=$PATH:$HOME/Go/go/bin" >> /root/.bashrc

# cd back to /root
WORKDIR /root