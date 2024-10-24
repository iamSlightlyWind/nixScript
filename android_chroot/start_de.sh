#!/bin/sh
echo ">>> Starting KDE Plasma Desktop Environment"

mnt="/data/local/tmp/chrootarch"

if ! mountpoint -q $mnt/dev; then
  echo "[WARNING] Mount points not found"
  sh $mnt/../mount.sh
fi

echo "[Debug] $DISPLAY: $DISPLAY"
busybox chroot $mnt su - slightlywind -c "export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4713 && dbus-launch --exit-with-session startplasma-x11"