#!/bin/env bash

# This will be ran from the chrooted env.

user=$1
password=$2
fast=$3
partition=$4
hostname=$5

# setup mirrors
if [ "$fast" -eq "1"]
then
    echo 'Setting up mirrors'
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
    sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
    rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
else
    echo 'Skipping mirror ranking because fast'
fi

# setup timezone
echo 'Setting up timezone'
timedatectl set-ntp true
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
timedatectl set-timezone Europe/Berlin
hwclock --systohc

# setup locale
echo 'Setting up locale'
sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# setup hostname
echo 'Setting up hostname'
echo $hostname > /etc/hostname

# build
echo 'Building'
pacman -S mkinitcpio --noconfirm
mkinitcpio -P

# install bootloader
echo 'Installing bootloader'
pacman -S grub --noconfirm
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# install networkmanager
pacman -S --noconfirm networkmanager
systemctl enable NetworkManager

# install Xorg
echo 'Installing Xorg'
pacman -S --noconfirm xorg xorg-xinit xterm

# install git
echo 'Installing git'
pacman -S --noconfirm git
# install wifi-menu
pacman -S --noconfirm wifi-menu dialog

# user management
echo 'Setting up user'
read -t 1 -n 1000000 discard      # discard previous input
echo 'root:'$password | chpasswd
useradd -m -G wheel $user
echo $user:$password | chpasswd
echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# enable services
systemctl enable ntpdate.service

# Install YADM
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
# clone and bootstrap
yadm clone --bootstrap https://github.com/juligreen/Configfiles

echo 'Done'
