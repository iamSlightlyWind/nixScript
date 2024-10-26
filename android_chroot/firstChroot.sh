#!/bin/bash

rm -r /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinuxarm
pacman-key --refresh-keys

groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 1003 aid_graphics
usermod -G 3003 -a root

