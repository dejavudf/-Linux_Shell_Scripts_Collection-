#!/bin/bash

ip=192.168.4.254
mail_to=root@localhost

nmap -n -sS -p80 192.168.4.254 | grep -q "^80/tcp open"
if [ $? -eq 0 ];then
    echo "http service is running on $ip" | mail -s http_status_OK $mail_to
else
    echo "http service is stoped on $ip" | mail -s http_status_error $mail_to
fi
