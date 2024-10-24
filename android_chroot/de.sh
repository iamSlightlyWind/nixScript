#!/bin/sh
mnt="/data/local/tmp/chrootarch"

if ! mountpoint -q $mnt/dev; then
  sh $mnt/../mount.sh
fi

busybox chroot $mnt su - slightlywind -c "export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4713 && dbus-launch --exit-with-session startplasma-x11"