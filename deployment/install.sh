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
	echo "Enter partiton to instll on(i.e /dev/sda):"
    read partition
else
    partition=$4
fi


if [ -z "$5" ]
then
	echo "Enter Hostname:"
    read hostname
else
    hostname=$5
fi

# set time
timedatectl set-ntp true

#partiton disk
parted --script $partiton mklabel gpt mkpart primary ext4 0% 90% mkpart primary linux-swap 90% 100%
mkfs.ext4 ${partition}1
mkswap ${partition}2
swapon ${partition}2
mount ${partition}1 /mnt

mkdir /mnt/boot/

# pacstrap
pacstrap /mnt base base-devel

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

# chroot
wget https://raw.githubusercontent.com/juligreen/Configfiles/master/deployment/chroot-install.sh -O /mnt/chroot-install.sh
arch-chroot /mnt /bin/bash ./chroot-install.sh $user $password $fast $partition $hostname

# reboot
umount /mnt
reboot
