#!/bin/bash
sh ./kill.sh

MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &
virgl_test_server_android &

echo ">>> Starting X11 Server"
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
sudo busybox mount --bind $PREFIX/tmp /data/local/tmp/chrootarch/tmp
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &

sleep 3

echo ">>> Chrooting"

su -c "sh /data/local/tmp/start_chroot.sh"