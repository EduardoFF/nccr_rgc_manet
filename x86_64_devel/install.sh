cd /src/lcm
./bootstrap.sh
./configure && make install

cd /src/click
rm -rf bin/*
./configure  --disable-linuxmodule   --enable-tools=mixed
make install-tools install-local
make -C ./userlevel/ MINDRIVER=RNP_PKG
make -C ./userlevel/ MINDRIVER=RNP_CLIENT_PKG
cp ./userlevel/RNP_PKGclick /usr/local/bin 
cp ./userlevel/RNP_CLIENT_PKGclick /usr/local/bin 
cp -R scripts /root/click_scripts 
cd /root/click_scripts/ 
click-align rnp_scripts/rnp_linux_args.click > rnp_scripts/rnp_linux_args_aligned.click 


cd /src/libxbee3
make configure && make install

cd /src/manet_xbee_bridge
mkdir -p build
cd build
cmake ../src
make install
chmod +x /usr/local/bin/setup_manet 
chmod +x /usr/local/bin/setup_wlan 
cd ../src/scripts 
 python setup.py install





