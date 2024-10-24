#!/bin/sh
mnt="/data/local/tmp/chrootarch"
busybox mount -o remount,dev,suid /data

mkdir -p $mnt/dev/shm

if ! mountpoint -q $mnt/dev; then
  mount -o bind /dev $mnt/dev/
fi

if ! mountpoint -q $mnt/proc; then
  busybox mount -t proc proc $mnt/proc/
fi

if ! mountpoint -q $mnt/sys; then
  busybox mount -t sysfs sysfs $mnt/sys/
fi

if ! mountpoint -q $mnt/dev/pts; then
  busybox mount -t devpts devpts $mnt/dev/pts/
fi

if ! mountpoint -q $mnt/media/sdcard; then
  busybox mount -o bind /sdcard $mnt/media/sdcard
fi

if ! mountpoint -q $mnt/var/cache; then
  busybox mount -t tmpfs /cache $mnt/var/cache
fi

if ! mountpoint -q $mnt/dev/shm; then
  busybox mount -t tmpfs -o size=256M tmpfs $mnt/dev/shm
fi