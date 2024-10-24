#!/bin/sh
echo ">>> Mounting chroot directories"

mnt="/data/local/tmp/chrootarch"
busybox mount -o remount,dev,suid /data

rm -rf $mnt/dev/shm
mkdir $mnt/dev/shm

if ! mountpoint -q $mnt/dev; then
  echo "[I] Mounting 1/7: /dev"
  mount -o bind /dev $mnt/dev/
fi

if ! mountpoint -q $mnt/proc; then
  echo "[I] Mounting 2/7: /proc"
  busybox mount -t proc proc $mnt/proc/
fi

if ! mountpoint -q $mnt/sys; then
  echo "[I] Mounting 3/7: /sys"
  busybox mount -t sysfs sysfs $mnt/sys/
fi

if ! mountpoint -q $mnt/dev/pts; then
  echo "[I] Mounting 4/7: /dev/pts"
  busybox mount -t devpts devpts $mnt/dev/pts/
fi

if ! mountpoint -q $mnt/media/sdcard; then
  echo "[I] Mounting 5/7: /sdcard"
  busybox mount -o bind /sdcard $mnt/media/sdcard
fi

if ! mountpoint -q $mnt/var/cache; then
  echo "[I] Mounting 6/7: /var/cache"
  busybox mount -t tmpfs /cache $mnt/var/cache
fi

if ! mountpoint -q $mnt/dev/shm; then
  echo "[I] Mounting 7/7: /dev/shm"
  busybox mount -t tmpfs -o size=256M tmpfs $mnt/dev/shm
fi