#!/bin/bash

TERMUXHOME="/data/data/com.termux/files/home"
FILE="ArchLinuxARM-aarch64-latest.tar.gz"
CHROOTDIR="/data/local/tmp/chrootarch"
CHROOTSOURCE="/data/local/tmp/chrootarch.source"

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

if [ ! -d "$CHROOTSOURCE" ]; then
    if [ ! -f "$FILE" ]; then
        wget http://os.archlinuxarm.org/os/$FILE
    else
        echo "$FILE already exists."
    fi
    mkdir -p "$CHROOTSOURCE"
    tar xvf /data/data/com.termux/files/home/$FILE --numeric-owner -C "$CHROOTSOURCE"
else
    echo "$CHROOTSOURCE already exists."
fi

if [ -d "$CHROOTDIR" ]; then
    mv $CHROOTDIR $CHROOTDIR.bak
    rm -rf $CHROOTDIR.bak &
    mkdir -p "$CHROOTDIR"
    tar -cf - $CHROOTSOURCE | tar -xf - -C "$CHROOTDIR"
    mv $CHROOTDIR/* $CHROOTDIR
    rm -rf $CHROOTDIR/chrootarch
fi

mkdir -p "$CHROOTDIR"
cd "$CHROOTDIR"
echo "Current directory: $(pwd)"

tar xvf /data/data/com.termux/files/home/$FILE --numeric-owner

mkdir -p $CHROOTDIR/dev
mkdir -p $CHROOTDIR/media/sdcard
mkdir -p $CHROOTDIR/dev/shm
mkdir -p $CHROOTDIR/etc

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > $CHROOTDIR/resolv.conf
echo "127.0.0.1 localhost" > $CHROOTDIR/hosts

mv $CHROOTDIR/resolv.conf $CHROOTDIR/etc/resolv.conf
mv $CHROOTDIR/hosts $CHROOTDIR/etc/hosts

sh $TERMUXHOME/chroot.sh 