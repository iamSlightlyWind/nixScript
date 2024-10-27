#!/bin/bash
sh ./kill.sh

export MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw MESA_NO_ERROR=1 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy
virgl_test_server --use-egl-surfaceless &
virgl_test_server_android &

echo ">>> Starting X11 Server"
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
sudo busybox mount --bind $PREFIX/tmp /data/local/tmp/chrootarch/tmp
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &

sleep 3

echo ">>> Chrooting"

su -c "sh /data/local/tmp/start_chroot.sh"