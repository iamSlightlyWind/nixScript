#!/bin/bash

rm -r /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinuxarm
pacman-key --refresh-keys

groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 1003 aid_graphics
usermod -G 3003 -a root

rm /etc/pacman.d/mirrorlist
mv mirrorlist /etc/pacman.d/mirrorlist

pkg_list="net-tools sudo nano curl mesa mesa-utils firefox konsole wget git base-devel i3 fish neofetch"

while ! pacman -Syu --noconfirm; do
    sleep 1
done

while ! pacman -S $pkg_list --noconfirm; do
    sleep 1
done

while ! pacman -u *.tar.gz --noconfirm; do
    sleep 1
done

rm *.tar.gz


groupadd storage
groupadd wheel
useradd -m -g users -G wheel,audio,video,storage,aid_inet -s /bin/bash slightlywind
passwd slightlywind

echo "slightlywind ALL=(ALL:ALL) ALL" >> /etc/sudoers
sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf