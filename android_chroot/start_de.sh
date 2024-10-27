#!/bin/sh
echo ">>> Starting KDE Plasma Desktop Environment"

mnt="/data/local/tmp/chrootarch"

if ! mountpoint -q $mnt/dev; then
  echo "[WARNING] Mount points not found"
  sh $mnt/../mount.sh
fi

busybox chroot $mnt su - slightlywind -c "export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4713 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw && dbus-launch --exit-with-session startplasma-x11"