#!/bin/bash

REPO_DIR="/data/data/com.termux/files/home/nixscript/android_chroot"
TERMUXHOME="/data/data/com.termux/files/home"
CHECK_INTERVAL=5

while true; do
    cd $REPO_DIR
    git fetch origin

    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})

    if [ $LOCAL != $REMOTE ]; then
        echo "Updates found. Pulling changes..."
        git reset --hard
        git pull
        sh copy.sh
        cd $TERMUXHOME
        sudo sh install.sh
        exit 0
    else
        clear
        echo "No updates found."
    fi
done