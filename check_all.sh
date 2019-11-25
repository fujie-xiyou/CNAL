#!/bin/bash

users_=("user1" "user2") # 多个账户 如果账户数量少于你要多拨的数量 也可以工作 但是这样会有账户被登录多次
passwds_=("pass1" "pass2") # 密码和用户数量保持一致
interface_names=("macvlan1" "macvlan2") # 需要认证的接口列表 如果多于账户数量，那么部分账户会被登录多次
CURRENT_DIR=$(cd $(dirname $0); pwd)
number=1
showip=0

while [[ $# -ge 1 ]]; 
do
    case $1 in
        -p|--ifnames )
            interface_names=$2
            echo $interface_names
            shift 2
            ;;
        -i|--showip )
            showip=1
            shift
            ;;
        -h|--help|* )
            echo "usage: $0 [-i|--ifnames "if1 if2"] [-p|--showip]"
            shift
            exit 1
            ;;
    esac
done
date "+%F %T"
for i in $(seq 1 ${#interface_names[@]})
do
    interface_name=${interface_names[$i-1]}
    index=$(($(($i-1)) % ${#users_[@]}))
    echo -e "$interface_name: \c"
    bash $CURRENT_DIR/check_net.sh $interface_name ${users_[$index]} ${passwds_[$index]}
done
echo -------------------------------
