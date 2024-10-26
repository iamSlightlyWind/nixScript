#!/bin/bash
sh ./kill.sh

MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &
virgl_test_server_android &

echo ">>> Starting X11 Server"
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
sudo busybox mount --bind $PREFIX/tmp /data/local/tmp/chrootarch/tmp
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &

sleep 3

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

su -c "sh /data/local/tmp/start_de.sh"