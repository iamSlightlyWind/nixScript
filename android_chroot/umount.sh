#!/bin/bash
echo ">>> Unmounting chroot directories"

mnt="/data/local/tmp/chrootarch"

echo "[I] Unmounting 1/7: /dev"
if mountpoint -q $mnt/dev; then
  umount -l $mnt/dev || true
fi

echo "[I] Unmounting 2/7: /proc"
if mountpoint -q $mnt/proc; then
  umount -l $mnt/proc || true
fi

echo "[I] Unmounting 3/7: /sys"
if mountpoint -q $mnt/sys; then
  umount -l $mnt/sys || true
fi

echo "[I] Unmounting 4/7: /dev/pts"
if [ -d $mnt/dev/pts ] && mountpoint -q $mnt/dev/pts; then
  umount -l $mnt/dev/pts || true
fi

echo "[I] Unmounting 5/7: /sdcard"
if mountpoint -q $mnt/media/sdcard; then
  umount -l $mnt/media/sdcard || true
fi

echo "[I] Unmounting 6/7: /var/cache"
if mountpoint -q $mnt/var/cache; then
  umount -l $mnt/var/cache || true
fi

echo "[I] Unmounting 7/7: /dev/shm"
if mountpoint -q $mnt/dev/shm; then
  umount -l $mnt/dev/shm || true
fi