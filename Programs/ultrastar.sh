#!/bin/sh

sudo umount ~/Ultrastar
sudo umount ~/.ultrastardx
sshfs ubuntu:/hdd/other_data/Ultrastar/songs ~/Ultrastar
sshfs ubuntu:/hdd/other_data/Ultrastar/.ultrastardx ~/.ultrastardx
