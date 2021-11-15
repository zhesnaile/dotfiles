#!/bin/sh

if [ $(id -u) != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

cp /opt/switch_kvm_sample/deactivate/kvm.conf     /etc/modprobe.d/kvm.conf
cp /opt/switch_kvm_sample/deactivate/vfio.conf    /etc/modprobe.d/vfio.conf
cp /opt/switch_kvm_sample/deactivate/mkinitcpio.conf /etc/mkinitcpio.conf
cp /opt/switch_kvm_sample/deactivate/grub /etc/default/grub

mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg
