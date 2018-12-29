#!/bin/sh
#潘多拉/OpenWrt系统的虚拟wan功能默认虚拟出来的网卡名为 macvlan+数字
interface_name_prefix="macvlan" #虚拟网卡名前缀

date "+%F %T"
for i in 1 2 3 4 5
do
    interface_name=$interface_name_prefix$i
    echo -e "$interface_name: \c"
    sh check_net.sh $interface_name
done
echo -------------------------------
