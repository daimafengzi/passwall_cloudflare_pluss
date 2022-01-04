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

啊啊
