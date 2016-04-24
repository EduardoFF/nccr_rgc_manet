FROM debian:latest
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


RUN set -x \
&& ( git clone https://github.com/lcm-proj/lcm.git && cd lcm && git checkout ) \
&& cd lcm && ./bootstrap.sh \
&& ./configure && make install \
&& cd ../ && rm -rf lcm

RUN set -x \
&& ( git clone https://github.com/attie/libxbee3.git && cd libxbee3  && git checkout ) \
&& cd libxbee3 && make configure && make install \
&& cd ../ && rm -rf libxbee3

VOLUME /src
VOLUME /logs
VOLUME /mnt

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/usr/local/lib

COPY install.sh /root/

