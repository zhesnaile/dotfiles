#!/bin/sh

if [ $(id -u) != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

cp /opt/switch_kvm_sample/activate/kvm.conf     /etc/modprobe.d/kvm.conf
cp /opt/switch_kvm_sample/activate/vfio.conf    /etc/modprobe.d/vfio.conf
cp /opt/switch_kvm_sample/activate/mkinitcpio.conf /etc/mkinitcpio.conf
cp /opt/switch_kvm_sample/activate/grub /etc/default/grub

#systemctl disable amdgpu-clocks.service

mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg
