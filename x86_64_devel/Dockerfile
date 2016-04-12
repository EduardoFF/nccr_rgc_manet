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

VOLUME /devel

RUN set -x \
&& cd /devel \
&& git clone https://github.com/lcm-proj/lcm.git \
&& ( cd lcm && git checkout )

RUN set -x \
&& cd /devel \
&& git clone https://github.com/EduardoFF/click.git \
&& ( cd click && git checkout )

RUN set -x \
&& cd /devel \
&& git clone https://github.com/attie/libxbee3.git \
&& ( cd libxbee3  && git checkout )

RUN set -x \
&& cd /devel \
&& git clone https://github.com/EduardoFF/rnp_xbee_bridge.git \
&& ( cd rnp_xbee_bridge  && git checkout ) \

COPY install.sh /root/install.sh
RUN /root/install.sh

