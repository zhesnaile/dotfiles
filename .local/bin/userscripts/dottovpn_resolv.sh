#!/bin/sh

#check for sudo permissions
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

chattr -i /etc/resolv.conf
cp /etc/resolv_vpn.conf.bak /etc/resolv.conf
chattr +i /etc/resolv.conf               
