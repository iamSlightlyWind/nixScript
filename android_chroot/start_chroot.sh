#!/bin/sh
echo ">>> Entering chroot environment"

mnt="/data/local/tmp/chrootarch"

if ! mountpoint -q $mnt/dev; then
  echo "[WARNING] Mount points not found"
  sh $mnt/../mount.sh
fi

busybox chroot $mnt su - root