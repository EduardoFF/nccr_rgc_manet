FROM ubuntu
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
    && rm -rf /var/lib/apt/lists/*
WORKDIR /root
USER root
COPY *.sh /root/
RUN /root/install.sh

