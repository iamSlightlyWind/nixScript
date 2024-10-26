#!/bin/bash

TERMUXHOME="/data/data/com.termux/files/home"
FILE="ArchLinuxARM-aarch64-latest.tar.gz"
CHROOTDIR="/data/local/tmp/chrootarch"

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    wget http://os.archlinuxarm.org/os/$FILE
else
    echo "$FILE already exists."
fi

if [ -d "$CHROOTDIR" ]; then
    mv $CHROOTDIR $CHROOTDIR.bak
    rm -rf $CHROOTDIR.bak &
fi

mkdir -p "$CHROOTDIR"
cd "$CHROOTDIR"
echo "Current directory: $(pwd)"

tar xvf /data/data/com.termux/files/home/$FILE --numeric-owner

mkdir -p $CHROOTDIR/dev
mkdir -p $CHROOTDIR/media/sdcard
mkdir -p $CHROOTDIR/dev/shm
mkdir -p $CHROOTDIR/etc

echo -e "\nChecking for resolv.conf and hosts files..."
file "$CHROOTDIR/etc/resolv.conf"
file "$CHROOTDIR/etc/hosts"
echo -e "\n"

touch "$CHROOTDIR/etc/resolv.conf"
touch "$CHROOTDIR/etc/hosts"

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > $CHROOTDIR/etc/resolv.conf
echo "127.0.0.1 localhost" > $CHROOTDIR/etc/hosts

sh $TERMUXHOME/chroot.sh