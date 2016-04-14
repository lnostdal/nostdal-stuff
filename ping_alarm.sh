#!/bin/bash

for (( ; ; ))
do
    ping -w 5 -c 1 nostdal.duckdns.org &> /dev/null

    if [ $? -ne 0 ]; then
        paplay /usr/share/sounds/freedesktop/stereo/bell.oga
    fi
    sleep 5
done
