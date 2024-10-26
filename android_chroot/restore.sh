#!/bin/bash

TEMP="/data/local/tmp"
CHROOTDIR="chrootarch"
BACKUPDIR="chrootarch.bak"

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

cd $TEMP

rm -rf $CHROOTDIR
mkir -p $CHROOTDIR
tar -cf - $BACKUPDIR | tar -xf - -C $CHROOTDIR
mv $CHROOTDIR/$BACKUPDIR/* $CHROOTDIR
rm -rf $CHROOTDIR/$BACKUPDIR