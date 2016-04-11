mkdir /sources
cd /sources

git clone https://github.com/EduardoFF/click.git
git clone https://github.com/attie/libxbee3.git
git clone https://github.com/lcm-proj/lcm.git
git clone https://github.com/EduardoFF/rnp_xbee_bridge.git

cd /sources/lcm
./bootstrap.sh
./configure && make install

mkdir /root/click
cd /sources/click
rm -rf /sources/click/bin/*
make clean
./configure  --disable-linuxmodule   --enable-tools=mixed
make install
make -C ./userlevel/ MINDRIVER=RNP_PKG
make -C ./userlevel/ MINDRIVER=RNP_CLIENT_PKG

cp ./userlevel/RNP_PKGclick /usr/local/bin
cp ./userlevel/RNP_CLIENT_PKGclick /usr/local/bin

cd /sources/libxbee3
make configure && make install

mkdir /root/xbee_bridge
cd /root/xbee_bridge
cmake /sources/rnp_xbee_bridge/src
make install




