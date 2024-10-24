#!/bin/bash
echo ">>> Killing processes..."
pkill -f com.termux.x11
killall -9 termux-x11 Xwayland pulseaudio virgl_test_server_android termux-wake-lock 2>/dev/null || true

echo ">>> Starting X11 Server"
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &

sleep 3

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

su -c "sh /data/local/tmp/start_de.sh"