#!/bin/bash
echo ">>> Killing processes..."

pkill -f com.termux.x11
killall -9 termux-x11 Xwayland pulseaudio virgl_test_server_android termux-wake-lock 2>/dev/null || true

su -c "sh /data/local/tmp/umount.sh"