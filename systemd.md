# 动手实战Systemd
## Systemd 入门教程：命令篇 by 阮一峰的网络日志
- 第三节系统管理  https://asciinema.org/a/j78ctANafjBPQItEH0w0ZE4b2
- 第四节4.1-2unit https://asciinema.org/a/pbI7ZvvckLdvsiaOdvCBbl6Yp
- 第四节4.2-3unit  https://asciinema.org/a/PzJNDOUU28qa8ovJcsKJPIaeF 
-  第四节4.4-第五节5.2Unit 的配置文件  https://asciinema.org/a/5pL909915UacXKPSejbfEUV2U
- 第五节5.3-第七节日志管理 https://asciinema.org/a/Z5Tsb3UhtL6mPLxt9rXeYwtai
## Systemd 入门教程：实战篇 by 阮一峰的网络日志
- https://asciinema.org/a/JFO4yHJlzgUsQjiYYt3d1ItDz
## 问题
- 没想到我的问题竟然是systemctl把最后的l看成1 所以一直出错
## 本章完成后的自查清单
- 如何添加一个用户并使其具备sudo执行程序的权限？
 ```
sudo adduser XXX 
sudo usermod -G sudo -a XXX
```
- 如何将一个用户添加到一个用户组？
```
usermod -a -G
```
- 如何查看当前系统的分区表和文件系统详细信息？
```
fdisk -l 
df -h
```
- 如何实现开机自动挂载Virtualbox的共享目录分区？
```
//在文件 /etc/rc.local 中（用root用户）追加如下命令
mount -t vboxsf java /mnt/share
```
- 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
```
lvextend -L [+] xG PATH
lvreduce -L [-] xG PATH
```
- 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？     
ExecStartPost指定在启动执行ExecStart的命令后的收尾工作，可以有多个；ExecStopPost指定在ExecStop命令执行后的收尾工作，也可以有多个。因此，要设置： ExecStartPost=网络连通时运行的指定脚本的路径 ExecStopPost =网络断开时运行的指定脚本的路径
- 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？     
[Service] Restart=always systemctl start [进程名]