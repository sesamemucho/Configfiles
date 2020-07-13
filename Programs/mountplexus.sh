#!/bin/sh
sudo umount /hdd
sudo umount /rmt

sshfs -o cache=yes -o kernel_cache -o Ciphers=chacha20-poly1305@openssh.com -o Compression=no -o ServerAliveCountMax=3 -o ServerAliveInterval=15 -o reconnect -C ubuntu:/hdd /hdd && \
sshfs -o cache=yes -o kernel_cache -o Ciphers=chacha20-poly1305@openssh.com -o Compression=no -o ServerAliveCountMax=3 -o ServerAliveInterval=15 -o reconnect -C ubuntu:/ /rmt || \
(sudo umount /hdd ; sudo umount /rmt ; \
sshfs plexiglas.xyz:/hdd /hdd && \
sshfs plexiglas.xyz:/ /rmt)
