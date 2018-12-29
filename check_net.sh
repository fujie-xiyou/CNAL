#!/bin/sh
timeout=5
target="www.baidu.com"
ret_code=`curl -I -s --connect-timeout $timeout $target --interface $1 -w %{http_code} | tail -n1`
i=1
while [ "x$ret_code" != "x200" ]
    do
        if [ "$i" -gt 5 ]
        then
            echo "more then 5 times , quit."
            exit 1;
        fi
        echo no
        sh ./curlxyl.sh $1
        ret_code=`curl -I -s --connect-timeout $timeout $target --interface $1 -w %{http_code} | tail -n1`
        i=$((i+1))
    done
echo yes

