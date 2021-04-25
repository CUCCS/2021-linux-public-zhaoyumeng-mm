# shell脚本编程基础
## 任务一
用bash编写一个图片批处理脚本，实现以下功能：
原图：![airplane](airplane.png)![cuc](cuc.jpg)
- 支持命令行参数方式使用不同功能
![help](help.png)
- 支持对指定目录下所有支持格式的图片文件进行批处理
- 支持以下常见图片批处理功能的单独使用或组合使用
    - 支持对jpeg格式图片进行图片质量压缩
    ![压缩](压缩.png)
    - 支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
    ![resize](resize.png)
    - 支持对图片批量添加自定义文本水印
    ![watermark](watermark.png)
    加水印后图片：![airplanewatermark](airplanewatermark.png)![cucwater](cucwater.jpg)
    - 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
    ![Prefix](Prefix.png)
    ![Prefix-rename](Prefix-rename.png)
    ![suffix](suffix.png)
    ![suffix-rename](suffix-rename.png)
    - 支持将png/svg图片统一转换为jpg格式图片
    ![transtojpg](transtojpg.png)
    ![transtojpg1](transtojpg1.png)
## 任务二
用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
- 2014世界杯运动员数据
    - 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
    ![range](range.png)
    - 统计不同场上位置的球员数量、百分比
    ![position](position.png)
    - 名字最长的球员是谁？名字最短的球员是谁？
    ![name](name.png)
    - 年龄最大的球员是谁？年龄最小的球员是谁？
    ![age](age.png)
- Web服务器访问日志
    - 统计访问来源主机TOP 100和分别对应出现的总次数
    ```
    edams.ksc.nasa.gov 6530
    piweba4y.prodigy.com 4846
    163.206.89.4 4791
    piweba5y.prodigy.com 4607
    piweba3y.prodigy.com 4416
    www-d1.proxy.aol.com 3889
    www-b2.proxy.aol.com 3534
    www-b3.proxy.aol.com 3463
    www-c5.proxy.aol.com 3423
    www-b5.proxy.aol.com 3411
    www-c2.proxy.aol.com 3407
    www-d2.proxy.aol.com 3404
    www-a2.proxy.aol.com 3337
    news.ti.com 3298
    www-d3.proxy.aol.com 3296
    www-b4.proxy.aol.com 3293
    www-c3.proxy.aol.com 3272
    www-d4.proxy.aol.com 3234
    www-c1.proxy.aol.com 3177
    www-c4.proxy.aol.com 3134
    intgate.raleigh.ibm.com 3123
    www-c6.proxy.aol.com 3088
    www-a1.proxy.aol.com 3041
    mpngate1.ny.us.ibm.net 3011
    e659229.boeing.com 2983
    piweba1y.prodigy.com 2957
    webgate1.mot.com 2906
    www-relay.pa-x.dec.com 2761
    beta.xerox.com 2318
    poppy.hensa.ac.uk 2311
    vagrant.vf.mmc.com 2237
    palona1.cns.hp.com 1910
    www-proxy.crl.research.digital.com 1793
    koriel.sun.com 1762
    derec 1681
    trusty.lmsc.lockheed.com 1637
    gw2.att.com 1623
    cliffy.lfwc.lockheed.com 1563
    inet2.tek.com 1503
    disarray.demon.co.uk 1485
    gw1.att.com 1467
    128.217.62.1 1435
    interlock.turner.com 1395
    163.205.1.19 1360
    sgigate.sgi.com 1354
    bocagate.bocaraton.ibm.com 1336
    piweba2y.prodigy.com 1324
    gw3.att.com 1311
    keyhole.es.dupont.com 1310
    n1144637.ksc.nasa.gov 1297
    163.205.3.104 1292
    163.205.156.16 1256
    163.205.19.20 1252
    erigate.ericsson.se 1216
    gn2.getnet.com 1211
    gwa.ericsson.com 1089
    tiber.gsfc.nasa.gov 1079
    128.217.62.2 1054
    bstfirewall.bst.bls.com 1017
    163.206.137.21 1015
    spider.tbe.com 1013
    gatekeeper.us.oracle.com 1010
    www-c8.proxy.aol.com 995
    whopkins.sso.az.honeywell.com 984
    news.dfrc.nasa.gov 966
    128.159.122.110 949
    proxy0.research.att.com 940
    proxy.austin.ibm.com 925
    www-c9.proxy.aol.com 902
    bbuig150.unisys.com 901
    corpgate.nt.com 899
    sahp315.sandia.gov 890
    amdext.amd.com 869
    128.159.132.56 848
    n1121796.ksc.nasa.gov 830
    igate.uswest.com 825
    gatekeeper.cca.rockwell.com 819
    wwwproxy.sanders.com 815
    gw4.att.com 814
    goose.sms.fi 812
    128.159.144.83 808
    jericho3.microsoft.com 805
    128.159.111.141 798
    jericho2.microsoft.com 786
    sdn_b6_f02_ip.dny.rockwell.com 782
    lamar.d48.lilly.com 778
    163.205.11.31 776
    heimdallp2.compaq.com 772
    stortek1.stortek.com 771
    163.205.16.75 762
    mac998.kip.apple.com 759
    tia1.eskimo.com 742
    www-e1f.gnn.com 733
    www-b1.proxy.aol.com 718
    reddragon.ksc.nasa.gov 715
    128.159.122.137 711
    rmcg.cts.com 701
    bambi.te.rl.ac.uk 701
    electron.mcc.com 697
    163.205.23.76 691
    ```
    - 统计访问来源主机TOP 100 IP和分别对应出现的总次数
    ```
    163.206.89.4 4791
    128.217.62.1 1435
    163.205.1.19 1360
    163.205.3.104 1292
    163.205.156.16 1256
    163.205.19.20 1252
    128.217.62.2 1054
    163.206.137.21 1015
    128.159.122.110 949
    128.159.132.56 848
    128.159.144.83 808
    128.159.111.141 798
    163.205.11.31 776
    163.205.16.75 762
    128.159.122.137 711
    163.205.23.76 691
    206.27.25.1 672
    198.83.19.44 647
    199.1.50.225 641
    163.205.23.93 624
    139.169.174.102 610
    163.205.121.3 600
    140.229.116.37 598
    141.102.82.127 591
    163.206.140.4 586
    163.206.104.34 573
    204.62.245.32 567
    128.159.122.38 565
    128.217.62.224 563
    128.159.122.107 563
    128.159.122.180 553
    128.159.123.58 549
    163.205.154.11 544
    192.112.22.119 532
    163.205.16.100 518
    199.201.186.103 503
    128.159.146.40 503
    128.159.122.160 494
    192.77.40.4 486
    193.143.192.106 482
    152.163.192.5 480
    163.205.23.71 478
    139.169.30.50 475
    128.159.122.144 469
    163.234.140.22 466
    163.205.150.22 463
    128.217.61.184 457
    163.205.23.72 451
    198.83.19.40 448
    128.159.122.14 446
    199.201.186.104 443
    198.83.19.47 443
    128.217.61.15 443
    128.159.121.34 441
    128.159.121.41 438
    160.205.119.27 435
    163.205.154.17 432
    152.163.192.38 432
    128.159.122.15 432
    128.159.135.73 423
    128.159.135.38 423
    152.163.192.35 421
    128.159.76.128 415
    152.163.192.71 413
    128.159.63.159 412
    163.205.12.100 409
    133.53.64.33 404
    152.163.192.70 402
    128.159.121.64 397
    129.239.68.160 396
    152.163.192.36 391
    163.205.16.90 389
    128.32.196.94 389
    163.205.1.18 385
    163.206.136.1 384
    147.147.191.43 383
    163.205.16.104 374
    152.163.192.69 374
    193.178.53.180 373
    128.217.63.27 371
    130.110.74.81 367
    204.69.0.27 366
    163.206.130.46 365
    152.163.192.67 359
    163.205.54.76 357
    152.163.192.7 356
    198.83.19.43 354
    128.159.137.43 350
    147.74.110.61 348
    163.205.23.44 345
    128.159.168.162 343
    158.27.59.88 336
    152.163.192.3 336
    163.205.166.15 335
    128.159.145.21 335
    163.205.2.180 332
    128.217.61.98 329
    152.163.192.66 328
    163.205.3.38 324
    163.205.2.35 324
    ```
    - 统计最频繁被访问的URL TOP 100
    ```
    /images/NASA-logosmall.gif 97410
    /images/KSC-logosmall.gif 75337
    /images/MOSAIC-logosmall.gif 67448
    /images/USA-logosmall.gif 67068
    /images/WORLD-logosmall.gif 66444
    /images/ksclogo-medium.gif 62778
    /ksc.html 43687
    /history/apollo/images/apollo-logo1.gif 37826
    /images/launch-logo.gif 35138
    / 30346
    /images/ksclogosmall.gif 27810
    /shuttle/missions/sts-69/mission-sts-69.html 24606
    /shuttle/countdown/ 24461
    /shuttle/missions/sts-69/count69.gif 24383
    /shuttle/missions/sts-69/sts-69-patch-small.gif     23405
    /shuttle/missions/missions.html 22453
    /images/launchmedium.gif 19877
    /htbin/cdt_main.pl 17247
    /shuttle/countdown/images/countclock.gif 12160
    /icons/menu.xbm 12137
    /icons/blank.xbm 12057
    /software/winvn/winvn.html 10345
    /icons/image.xbm 10308
    /history/history.html 10134
    /history/apollo/images/footprint-logo.gif 10126
    /history/apollo/images/apollo-small.gif 9439
    /history/apollo/images/footprint-small.gif 9230
    /software/winvn/winvn.gif 9037
    /history/apollo/apollo.html 8985
    /software/winvn/wvsmall.gif 8662
    /software/winvn/bluemarb.gif 8610
    /htbin/cdt_clock.pl 8583
    /shuttle/countdown/liftoff.html 7865
    /shuttle/resources/orbiters/orbiters-logo.gif 7389
    /images/shuttle-patch-logo.gif 7261
    /history/apollo/apollo-13/apollo-13.html 7177
    /images/ 7040
    /shuttle/countdown/video/livevideo2.gif 7029
    /images/kscmap-tiny.gif 6615
    /shuttle/technology/sts-newsref/stsref-toc.html     6517
    /history/apollo/apollo-13/apollo-13-patch-small.    gif 6309
    /shuttle/missions/sts-71/sts-71-patch-small.gif     5613
    /shuttle/missions/sts-69/images/images.html 5264
    /icons/text.xbm 5248
    /images/construct.gif 5093
    /images/shuttle-patch-small.gif 4869
    /shuttle/missions/sts-69/movies/movies.html 4846
    /shuttle/missions/sts-70/sts-70-patch-small.gif     4791
    /icons/unknown.xbm 4785
    /shuttle/missions/sts-69/liftoff.html 4559
    /facilities/lc39a.html 4464
    /shuttle/resources/orbiters/endeavour.html 4434
    /history/apollo/images/apollo-logo.gif 4365
    /shuttle/missions/sts-70/mission-sts-70.html 4066
    /images/lc39a-logo.gif 4024
    /shuttle/resources/orbiters/endeavour-logo.gif  3817
    /shuttle/technology/sts-newsref/sts_asm.html 3706
    /shuttle/countdown/countdown.html 3518
    /shuttle/missions/sts-71/movies/movies.html 3507
    /shuttle/countdown/video/livevideo.jpeg 3377
    /history/apollo/apollo-11/apollo-11.html 3140
    /shuttle/missions/sts-71/mission-sts-71.html 3130
    /shuttle/missions/sts-70/images/images.html 3087
    /shuttle/missions/sts-71/images/images.html 2945
    /shuttle/missions/sts-73/mission-sts-73.html 2939
    /images/faq.gif 2865
    /shuttle/technology/images/ srb_mod_compare_1-small.gif 2864
    /shuttle/technology/images/ srb_mod_compare_3-small.gif 2818
    /shuttle/technology/images/ srb_mod_compare_6-small.gif 2715
    /history/apollo/apollo-11/apollo-11-patch-small.    gif 2701
    /elv/elvpage.htm 2586
    /shuttle/missions/sts-73/sts-73-patch-small.gif     2544
    /shuttle/countdown/video/sts-69-prelaunch-pad.gif   2385
    /shuttle/missions/51-l/mission-51-l.html 2343
    /images/launch-small.gif 2293
    /facilities/tour.html 2256
    /shuttle/missions/51-l/51-l-patch-small.gif 2201
    /images/kscmap-small.gif 2172
    /shuttle/resources/orbiters/challenger.html 2171
    /shuttle/missions/sts-71/movies/sts-71-launch.mpg   2159
    /shuttle/technology/sts-newsref/sts-lcc.html 2146
    /htbin/wais.pl 2133
    /facts/about_ksc.html 2120
    /history/mercury/mercury.html 2107
    /images/mercury-logo.gif 2040
    /elv/elvhead3.gif 1991
    /images/launchpalms-small.gif 1979
    /images/whatsnew.gif 1936
    /history/apollo/apollo-spacecraft.txt 1929
    /facilities/vab.html 1915
    /shuttle/resources/orbiters/columbia.html 1912
    /shuttle/countdown/lps/fr.html 1908
    /shuttle/resources/orbiters/challenger-logo.gif     1904
    /images/ksclogo.gif 1892
    /whats-new.html 1891
    /elv/endball.gif 1874
    /history/apollo/apollo-13/apollo-13-info.html 1869
    /shuttle/missions/sts-74/mission-sts-74.html 1868
    /elv/PEGASUS/minpeg1.gif 1845
    /elv/SCOUT/scout.gif 1835
    ```
    - 统计不同响应状态码的出现次数和对应百分比
    ![response](response.png)
    - 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
    ![4xx](4xx.png)
    - 给定URL输出TOP 100访问来源主机(见代码)
## 实验操作
```
sudo apt-get update && sudo apt-get install imagemagick
```
## 参考资料
- (2条消息) convert: not found_冲冲那年的博客-CSDN博客 https://blog.csdn.net/qq_26569761/article/details/51387130
- (2条消息) linux下使用convert命令修改图片分辨率_王文松的博客-CSDN博客 https://blog.csdn.net/mybelief321/article/details/9969949
- (2条消息) linux php basename,如何在Shell脚本中提取文件名和扩展名_敏大的博客-CSDN博客 https://blog.csdn.net/weixin_31151281/article/details/115517289
- (2条消息) linux shell批量压缩某个目录下图片大小_olivor的专栏-CSDN博客 https://blog.csdn.net/olivor/article/details/49232527
- [批处理教程之Shell]001.文本处理 - SD.Team - 博客园 https://www.cnblogs.com/superdo/p/4455407.html#id-awk
- shell的sort命令 - 傲娇的草履虫 - 博客园 https://www.cnblogs.com/delav/p/9956819.html
## 问题
- 实验中svg出现问题 无法解决