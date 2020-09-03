#!/bin/sh

echo "0.0.0.0 freshrss.plexiglas.xyz" > /etc/hosts
echo "0.0.0.0 https://freshrss.plexiglas.xyz" >> /etc/hosts
echo "0.0.0.0 reddit.com" >> /etc/hosts
echo "0.0.0.0 old.reddit.com" >> /etc/hosts


curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts >> /etc/hosts
