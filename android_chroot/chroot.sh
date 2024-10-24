#!/bin/bash
sh ./kill.sh

echo ">>> Chrooting"

su -c "sh /data/local/tmp/start_chroot.sh"