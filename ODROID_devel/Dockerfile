FROM armv7/armhf-debian:latest
MAINTAINER Eduardo Feo Flushing <eduardo@idsia.ch>
LABEL Description="This image is used to setup an adhoc network" Vendor="IDSIA" Version="1.0"


RUN apt-get update && apt-get install -y \
gcc \
g++ \
build-essential \
libgoogle-glog-dev \
libgps-dev \
autoconf \
libtool \
libglib2.0-dev \
python-dev \
cmake \
iw \
git \
wireless-tools \
net-tools && rm -rf /var/lib/apt/lists/*
WORKDIR /root
USER root

VOLUME /logs
VOLUME /mnt
VOLUME /src

COPY install.sh /root/install.sh

