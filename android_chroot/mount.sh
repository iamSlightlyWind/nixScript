#!/bin/sh
echo ">>> Mounting chroot directories"

mnt="/data/local/tmp/chrootarch"
busybox mount -o remount,dev,suid /data

echo "[I] Mounting 1/7: /dev"
if ! mountpoint -q $mnt/dev; then
  mount -o bind /dev $mnt/dev/
fi

echo "[I] Mounting 2/7: /proc"
if ! mountpoint -q $mnt/proc; then
  busybox mount -t proc proc $mnt/proc/
fi

echo "[I] Mounting 3/7: /sys"
if ! mountpoint -q $mnt/sys; then
  busybox mount -t sysfs sysfs $mnt/sys/
fi

echo "[I] Mounting 4/7: /dev/pts"
if ! mountpoint -q $mnt/dev/pts; then
  busybox mount -t devpts devpts $mnt/dev/pts/
fi

echo "[I] Mounting 5/7: /sdcard"
if ! mountpoint -q $mnt/media/sdcard; then
  busybox mount -o bind /sdcard $mnt/media/sdcard
fi

echo "[I] Mounting 6/7: /var/cache"
if ! mountpoint -q $mnt/var/cache; then
  busybox mount -t tmpfs /cache $mnt/var/cache
fi

echo "[I] Mounting 7/7: /dev/shm"
rm -rf /data/local/tmp/chrootarch/dev/shm
mkdir /data/local/tmp/chrootarch/dev/shm
chmod 777 /data/local/tmp/chrootarch/dev/shm
busybox mount -t tmpfs -o size=256M tmpfs $mnt/dev/shm