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

val3=($(sed -n '3p' result.csv ) )
array3=(${val3//,/ })
anycast3="${array3[0]}"

val4=($(sed -n '4p' result.csv ) )
array4=(${val4//,/ })
anycast4="${array4[0]}"

val5=($(sed -n '5p' result.csv ) )
array5=(${val5//,/ })
anycast5="${array5[0]}"

val6=($(sed -n '6p' result.csv ) )
array6=(${val6//,/ })
anycast6="${array6[0]}"

val7=($(sed -n '7p' result.csv ) )
array7=(${val7//,/ })
anycast7="${array7[0]}"

val8=($(sed -n '8p' result.csv ) )
array8=(${val8//,/ })
anycast8="${array8[0]}"

val9=($(sed -n '9p' result.csv ) )
array9=(${val9//,/ })
anycast9="${array9[0]}"

val10=($(sed -n '10p' result.csv ) )
array10=(${val10//,/ })
anycast10="${array10[0]}"

val11=($(sed -n '11p' result.csv ) )
array11=(${val11//,/ })
anycast11="${array11[0]}"

echo "IP1：$anycast"
echo "IP2：$anycast3"
echo "IP3：$anycast4"
echo "IP4：$anycast5"
echo "IP5：$anycast6"
echo "IP6：$anycast7"
echo "IP7：$anycast8"
echo "IP8：$anycast9"
echo "IP9：$anycast10"
echo "IP10：$anycast11"

#设置passwall的IP
uci set passwall.36b59bcf1d5b41a2a89f87026ed48b85.address=$anycast
uci set passwall.d9e86dca4e9f45a5bd393a12122072e9.address=$anycast3
uci set passwall.2a17ed2966e7474f8f46139711e9aee2.address=$anycast4
uci set passwall.a1d7615a501847ceb5e557ac68f9eb5f.address=$anycast5
uci set passwall.ec1add60d4f24816bb0a546d016679b8.address=$anycast6
uci set passwall.695cb8f679a046649b7b0f2c1dbd3426.address=$anycast7
uci set passwall.9ebeb8f7328e4e44ba99524f89f4cc3c.address=$anycast8
uci set passwall.aa3a370e953e47f290e65bde48cfb7eb.address=$anycast9
uci set passwall.1cc4384d183942aa9883e2425601489d.address=$anycast10
uci set passwall.ba86ec09658045118e8c333d5225cbdc.address=$anycast11
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
