#!/bin/bash

## Regular ping doesn't work on all networks or some networks give fake responses.
## A HTTPS (TLS) response is pretty fail-safe; no proxy, firewall or router can mess with this.

for (( ; ; ))
do
    wget -T 10 -O - https://encrypted.google.com &> /dev/null
    if [ $? -ne 0 ]; then
        paplay /usr/share/sounds/freedesktop/stereo/bell.oga
    fi
    sleep 5 # Because sometimes wget will return instantly i.e. when there are no active networks.
done
