#!/bin/bash

## Regular ping doesn't work on all networks or some networks give fake responses.
## A HTTPS (TLS) response is pretty fail-safe; no proxy, firewall or router can mess with this.

for (( ; ; ))
do

    wget -T 10 -O - https://nostdal.duckdns.org/ping.html &> /dev/null

    if [ $? -ne 0 ]; then
        paplay /usr/share/sounds/freedesktop/stereo/bell.oga
    fi
    sleep 5
done
