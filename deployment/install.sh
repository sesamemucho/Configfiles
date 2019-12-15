#!/bin/env bash

if [ -z "$1" ]
then
    echo "Enter your username: "
    read user
else
    user=$1
fi

if [ -z "$2" ]
then
    echo "Enter your master password: "
    read -s password
else
    password=$2
fi

if [ -z "$3" ]
then
    echo "Do you want to skip rankmirrors (faster upfront)? [y/N] "
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        fast=1
    else
        fast=0
    fi
else
    fast=$3
fi

if [ -z "$4" ]
then
	lsblk
	echo "Enter partiton to instll on(i.e /dev/sda)"
    read partition
else
    partition=$4
fi

# set time
timedatectl set-ntp true

#partiton disk
parted --script $partiton mklabel boot mkpart primary ext4 0 200M mklabel main mkpart primary ext4 200M 90% mkpart primary linux-swap 90% 100%
mkfs.ext4 ${partition}1
mkfs.ext4 ${partition}2
mkswap ${partition}3
swapon ${partition}3
mount ${partition}2 /mnt
mount ${partition}1 /mnt/boot

# pacstrap
pacstrap /mnt base base-devel

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

# chroot
wget https://raw.githubusercontent.com/abrochard/spartan-arch/master/chroot-install.sh -O /mnt/chroot-install.sh
arch-chroot /mnt /bin/bash ./chroot-install.sh $user $password $fast

# reboot
umount /mnt
reboot
