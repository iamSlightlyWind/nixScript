#!/bin/sh
echo ">>> Entering chroot environment"

mnt="/data/local/tmp/chrootarch"



busybox chroot $mnt su - slightlywind