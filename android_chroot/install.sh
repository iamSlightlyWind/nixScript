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
    echo "Removing old $CHROOTDIR"
    exit 1
    rm -rf "$CHROOTDIR"
fi

mkdir -p "$CHROOTDIR"
cd "$CHROOTDIR"
echo "Current directory: $(pwd)"

tar xvf /data/data/com.termux/files/home/$FILE --numeric-owner

mkdir $CHROOTDIR/dev
mkdir $CHROOTDIR/media/sdcard
mkdir $CHROOTDIR/dev/shm
mkdir -p $CHROOTDIR/etc

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > $CHROOTDIR/etc/resolv.conf
echo "127.0.0.1 localhost" > $CHROOTDIR/etc/hosts