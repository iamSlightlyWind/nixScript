#!/bin/bash
echo ">>> Unmounting chroot directories"

mnt="/data/local/tmp/chrootarch"

# Unmount /dev
if mountpoint -q $mnt/dev; then
  echo "[I] Unmounting 1/7: /dev"
  umount -l $mnt/dev || true
fi

# Unmount /proc
if mountpoint -q $mnt/proc; then
  echo "[I] Unmounting 2/7: /proc"
  umount -l $mnt/proc || true
fi

# Unmount /sys
if mountpoint -q $mnt/sys; then
  echo "[I] Unmounting 3/7: /sys"
  umount -l $mnt/sys || true
fi

# Unmount /dev/pts
if [ -d $mnt/dev/pts ] && mountpoint -q $mnt/dev/pts; then
  echo "[I] Unmounting 4/7: /dev/pts"
  umount -l $mnt/dev/pts || true
fi

# Unmount /sdcard
if mountpoint -q $mnt/media/sdcard; then
  echo "[I] Unmounting 5/7: /sdcard"
  umount -l $mnt/media/sdcard || true
fi

# Unmount /cache
if mountpoint -q $mnt/var/cache; then
  echo "[I] Unmounting 6/7: /var/cache"
  umount -l $mnt/var/cache || true
fi

# Unmount /dev/shm
if mountpoint -q $mnt/dev/shm; then
  echo "[I] Unmounting 7/7: /dev/shm"
  umount -l $mnt/dev/shm || true
fi