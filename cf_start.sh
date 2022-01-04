#!/bin/sh

#停止passwall
/etc/init.d/passwall stop

#停止ssrplus
#/etc/init.d/shadowsocksr stop

sleep 2s

##cd CloudflareST/
./CloudflareST -sl 1.7 -tl 180 -dn 10


sleep 2s

echo "查询完毕，开始查询最快的IP"

#获取csv的第一条的IP
val1=($(sed -n '2p' result.csv ) )
array=(${val1//,/ })
anycast="${array[0]}"

echo "最快的IP为：$anycast"

#设置passwall的IP
uci set passwall.1cc4384d183942aa9883e2425601489d.address=$anycast
uci commit passwall

#启动passwall
/etc/init.d/passwall restart

#设置ssrplus的IP
#uci set shadowsocksr.@servers[1].server=$anycast
#uci commit shadowsocksr

#启动ssrplus
#/etc/init.d/shadowsocksr restart
