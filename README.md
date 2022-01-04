####  1.配置Vps
-域名一个，此到CloudFlare并解析域名到台VPS
-开启CloudFlare的“小云朵”

####  2.获取passwall的ID
![图片](https://cdn.jsdelivr.net/gh/daimafengzi/daimafengzi@0379773bce2701b72624801c680c6c1508fc1afc/2022/01/04/06eb48780a1e0ed598958f047e658774.png)
![图片](https://cdn.jsdelivr.net/gh/daimafengzi/daimafengzi@d1b92646bd8983630bc2c86f6ebe1454fb2ba135/2022/01/04/52011f3b63e6beb7f1210de61f29a9f1.png)


####  3.拉取CloudflareSpeedTest
 - [ CloudflareSpeedTest ](https://github.com/XIU2/CloudflareSpeedTest)



####  4.设置定时任务
`0 18 * * * bash /root/cf_start.sh > /dev/null`

####【斐讯N1】拉取命令
# 下载 CloudflareST 压缩包（自行根据需求替换 URL 中 [版本号] 和 [文件名]）
wget -N https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.0.2/CloudflareST_linux_arm64.tar.gz
# 注意！国内下载时，建议把 URL 中的 github.com 替换为 download.fastgit.org (镜像站) 以避免下载失败

# 解压（不需要删除旧文件，会直接覆盖，自行根据需求替换 文件名）删除
tar -zxf CloudflareST_linux_amd64.tar.gz

# 删除压缩包
rm -rf CloudflareST_linux_amd64.tar.gz

# 赋予执行权限
chmod +x CloudflareST

# 运行（不带参数）
./CloudflareST

# 运行（带参数示例）
./CloudflareST -dd -tll 90
