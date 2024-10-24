#!/bin/bash

mnt="/data/local/tmp/chrootarch"

# Unmount /dev
if mountpoint -q $mnt/dev; then
  umount $mnt/dev
fi

# Unmount /proc
if mountpoint -q $mnt/proc; then
  umount $mnt/proc
fi

# Unmount /sys
if mountpoint -q $mnt/sys; then
  umount $mnt/sys
fi

# Unmount /dev/pts
if mountpoint -q $mnt/dev/pts; then
  umount $mnt/dev/pts
fi

# Unmount /sdcard
if mountpoint -q $mnt/media/sdcard; then
  umount $mnt/media/sdcard
fi

# Unmount /cache
if mountpoint -q $mnt/var/cache; then
  umount $mnt/var/cache
fi

# Unmount /dev/shm
if mountpoint -q $mnt/dev/shm; then
  umount $mnt/dev/shm
fi