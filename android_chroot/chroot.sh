#!/bin/bash
TEMP="/data/local/tmp"

sh $TEMP/kill.sh

echo ">>> Chrooting"

su -c "sh /data/local/tmp/start_chroot.sh"