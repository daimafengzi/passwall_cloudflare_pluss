#!/bin/sh

#停止passwall
#/etc/init.d/shadowsocksr stop
/etc/init.d/passwall stop

sleep 2s


./CloudflareST -sl 2 -tl 160 -dn 10

sleep 2s

echo "查询完毕，开始查询最快的IP"
#获取csv的第一条的IP
val1=$(sed -n '2p' result.csv )
val2=$(sed -n '3p' result.csv )
val3=$(sed -n '4p' result.csv )
val4=$(sed -n '5p' result.csv )
val5=$(sed -n '6p' result.csv )
val6=$(sed -n '7p' result.csv )
val7=$(sed -n '8p' result.csv )
val8=$(sed -n '9p' result.csv )
val9=$(sed -n '10p' result.csv )
val10=$(sed -n '11p' result.csv )

oldIFS=$IFS
IFS=","
set -- ${val1}
anycast1="$1"
uci set passwall.6897ca9c7d3c4595bc181f67f459fa3f.address=$anycast1

set -- ${val2}
anycast2="$1"
uci set passwall.ee3a7e649756411aa4ab1127c77965a5.address=$anycast2


set -- ${val3}
anycast3="$1"
uci set passwall.7ba57c03df12452eba00d14c7d7f28f0.address=$anycast3


set -- ${val4}
anycast4="$1"
uci set passwall.3e3478518e7a4f3c8193c62383d82bbc.address=$anycast4

set -- ${val5}
anycast5="$1"
uci set passwall.d8d368341d26442193f58cd20cdfa631.address=$anycast5

set -- ${val6}
anycast6="$1"
uci set passwall.a8814ddaa6af47c681097db5b25d7c7f.address=$anycast6

set -- ${val7}
anycast7="$1"
uci set passwall.1ed0ef1bdad946118b1f8ddbd434279a.address=$anycast7

set -- ${val8}
anycast8="$1"
uci set passwall.7270206207844e6bbef6600ae161b222.address=$anycast8

set -- ${val9}
anycast9="$1"
uci set passwall.d64c63bd171348a78982c78062f91c15.address=$anycast9


set -- ${val10}
anycast10="$1"
uci set passwall.689728984a9d49459feb800df328b6e3.address=$anycast10

IFS=$oldIFS

# anycast="${array[0]}"
echo "最快的IP为：$anycast1"
echo "最快的IP为：$anycast2"
echo "最快的IP为：$anycast3"
echo "最快的IP为：$anycast4"
echo "最快的IP为：$anycast5"
echo "最快的IP为：$anycast6"
echo "最快的IP为：$anycast7"
echo "最快的IP为：$anycast8"
echo "最快的IP为：$anycast9"
echo "最快的IP为：$anycast10"

#设置passwall的IP
uci commit passwall
#启动passwall
/etc/init.d/passwall restart

