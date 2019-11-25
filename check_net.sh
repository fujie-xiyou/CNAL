#!/bin/bash
timeout=5
target="www.baidu.com"
ret_code=`curl -I -s --connect-timeout $timeout $target --interface $1 -w %{http_code} | tail -n1`
i=1
CURRENT_DIR=$(cd $(dirname $0); pwd)
while [ "x$ret_code" != "x200" ]
    do
        if [ "$i" -gt 5 ]
        then
            echo "more then 5 times , quit."
            exit 1;
        fi
        echo no
        bash $CURRENT_DIR/curlxyl.sh $*
        ret_code=`curl -I -s --connect-timeout $timeout $target --interface $1 -w %{http_code} | tail -n1`
        i=$((i+1))
    done
echo yes

