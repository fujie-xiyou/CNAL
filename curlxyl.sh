#!/bin/bash
user=$2
passwd=$3
curl -s -o /dev/null -w "try to login and http_code = %{http_code}\n" -d \
    "DDDDD=$user&upass=$passwd&R1=0&R2=&R6=0&para=00&0MKKey=123456&buttonClicked=&redirect_url=&err_flag=&username=&password=&user=&cmd=&Login="\
    http://172.18.0.3/a70.htm\
    --interface $1 | tail -n1
