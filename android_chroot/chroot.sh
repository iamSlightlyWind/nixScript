#!/bin/bash
TERMUXHOME="/data/data/com.termux/files/home"

sh $TERMUXHOME/kill.sh

echo ">>> Chrooting"

su -c "sh /data/local/tmp/start_chroot.sh"