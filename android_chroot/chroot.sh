#!/bin/sh
echo ">>> Entering chroot environment"

mnt="/data/local/tmp/chrootarch"

if ! mountpoint -q $mnt/dev; then
  sh $mnt/../mount.sh
fi

busybox chroot $mnt su - slightlywind