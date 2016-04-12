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
&& git clone https://github.com/lcm-proj/lcm.git \
&& ( cd lcm && git checkout ) \
&& cd lcm && ./bootstrap.sh \
&& ./configure && make install \
&& cd ../ && rm -rf lcm

RUN set -x \
&& git clone https://github.com/EduardoFF/click.git \
&& ( cd click && git checkout ) \
&& rm -rf bin/* \
&& cd click && ./configure  --disable-linuxmodule   --enable-tools=mixed \
&& make install-tools \
&& make install-local \
&& make -C ./userlevel/ MINDRIVER=RNP_PKG \
&& make -C ./userlevel/ MINDRIVER=RNP_CLIENT_PKG \
&& cp ./userlevel/RNP_PKGclick /usr/local/bin \
&& cp ./userlevel/RNP_CLIENT_PKGclick /usr/local/bin \
&& cp -R scripts /root/click_scripts \
&& cd /root/click_scripts/ \
&& click-align rnp_scripts/rnp_linux_args.click > rnp_scripts/rnp_linux_args_aligned.click \
&& cd ../ && rm -rf click

RUN set -x \
&& git clone https://github.com/attie/libxbee3.git \
&& ( cd libxbee3  && git checkout ) \
&& cd libxbee3 && make configure && make install

RUN set -x \
&& git clone https://github.com/EduardoFF/rnp_xbee_bridge.git \
&& ( cd rnp_xbee_bridge  && git checkout ) \
&& cd rnp_xbee_bridge && mkdir build && cd build && cmake ../src \
&& make install \
&& chmod +x /usr/local/bin/setup_manet \
&& chmod +x /usr/local/bin/setup_wlan \
&& cd ../src/scripts \
&& python setup.py install
