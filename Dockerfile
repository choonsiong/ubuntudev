FROM ubuntu:20.04

# Install packages required
RUN apt-get update && apt-get install -y binutils build-essential sysstat strace vim iputils-ping iproute2 curl wget

# Install Valgrind, (tzdata is installed first to prevent asking for timezone configuration during valgrind installation)
ENV DEBIAN_FRONTEND=noninteractive
ENV TIMEZONE=/usr/share/zoneinfo/UTC
RUN set -ex; \
    apt-get install -y tzdata; \
    ln -fs "$TIMEZONE" /etc/localtime; \
    apt-get install -y valgrind; \
    apt-get clean
    
# Create directories for Go installation and bind mount
ENV GO_INSTALL_DIR=/usr/local/go
ENV MY_PLAYGROUND="$HOME"/playground
RUN set -ex; \
    mkdir -p "$HOME/go/src" "$HOME"/go/pkg "$HOME"/go/bin; \
    mkdir -p "$MY_PLAYGROUND";

# Install Go
WORKDIR /usr/local
ENV GO_TAR=https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
RUN set -ex; \
    wget -c "$GO_TAR" -O - | tar -xz; \
    echo "GOROOT=$GO_INSTALL_DIR" >> /root/.bashrc; \
    echo "GOPATH=$HOME/go" >> /root/.bashrc; \
    echo "GOBIN=$GO_INSTALL_DIR/bin" >> /root/.bashrc; \
    echo "PATH=$PATH:$GO_INSTALL_DIR/bin" >> /root/.bashrc

WORKDIR /root