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
uci set passwall.36b59bcf1d5b41a2a89f87026ed48b85.address=$anycast
uci set passwall.d9e86dca4e9f45a5bd393a12122072e9.address=${array[1]}
uci set passwall.2a17ed2966e7474f8f46139711e9aee2.address=${array[2]}
uci set passwall.a1d7615a501847ceb5e557ac68f9eb5f.address=${array[3]}
uci set passwall.ec1add60d4f24816bb0a546d016679b8.address=${array[4]}
uci set passwall.695cb8f679a046649b7b0f2c1dbd3426.address=${array[5]}
uci set passwall.9ebeb8f7328e4e44ba99524f89f4cc3c.address=${array[6]}
uci set passwall.aa3a370e953e47f290e65bde48cfb7eb.address=${array[7]}
uci set passwall.1cc4384d183942aa9883e2425601489d.address=${array[8]}
uci set passwall.ba86ec09658045118e8c333d5225cbdc.address=${array[9]}
wait
uci commit passwall

#启动passwall
wait
/etc/init.d/passwall restart

#设置ssrplus的IP
#uci set shadowsocksr.@servers[1].server=$anycast
#uci commit shadowsocksr

#启动ssrplus
#/etc/init.d/shadowsocksr restart
