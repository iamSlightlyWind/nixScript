#!/bin/bash

TERMUXHOME="/data/data/com.termux/files/home"
TMP="/data/local/tmp/"

sudo chmod 777 *.sh

su -c "rm $TMP/*.sh"

sudo cp -fp mount.sh $TMP
sudo cp -fp umount.sh $TMP
sudo cp -fp start_chroot.sh $TMP
sudo cp -fp start_de.sh $TMP

sudo cp -fp chroot.sh $TERMUXHOME
sudo cp -fp de.sh $TERMUXHOME
sudo cp -fp kill.sh $TERMUXHOME
sudo cp -fp both.sh $TERMUXHOME
sudo cp -fp install.sh $TERMUXHOME
sudo cp -fp "fetch&run.sh" $TERMUXHOME
mv mirrorlist $TERMUXHOME