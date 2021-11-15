#!/bin/sh

#check for sudo permissions
if [ $(id -u) != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#rm /etc/resolv.conf
chattr -i /etc/resolv.conf 
cp /etc/resolv.conf.bak /etc/resolv.conf
chattr +i /etc/resolv.conf
