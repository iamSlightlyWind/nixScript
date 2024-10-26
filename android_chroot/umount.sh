#!/bin/bash
echo ">>> Unmounting chroot directories"

mnt="/data/local/tmp/chrootarch"

echo "[I] Unmounting 1/8: /dev"
if mountpoint -q $mnt/dev; then
  umount -l $mnt/dev || true
fi

echo "[I] Unmounting 2/8: /proc"
if mountpoint -q $mnt/proc; then
  umount -l $mnt/proc || true
fi

echo "[I] Unmounting 3/8: /sys"
if mountpoint -q $mnt/sys; then
  umount -l $mnt/sys || true
fi

echo "[I] Unmounting 4/8: /dev/pts"
if [ -d $mnt/dev/pts ] && mountpoint -q $mnt/dev/pts; then
  umount -l $mnt/dev/pts || true
fi

echo "[I] Unmounting 5/8: /sdcard"
if mountpoint -q $mnt/media/sdcard; then
  umount -l $mnt/media/sdcard || true
fi

echo "[I] Unmounting 6/8: /var/cache"
if mountpoint -q $mnt/var/cache; then
  umount -l $mnt/var/cache || true
fi

echo "[I] Unmounting 7/8: /dev/shm"
if mountpoint -q $mnt/dev/shm; then
  umount -l $mnt/dev/shm || true
fi

echo "[I] Unmounting 8/8: /tmp"
if mountpoint -q $mnt/tmp; then
  umount -l $mnt/tmp || true
fi