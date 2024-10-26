#!/bin/bash

REPO_DIR="./nixscript/android_chroot"
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
        cd
        sudo sh install.sh
        exit 0
    else
        clear
        echo "No updates found."
        cd
    fi
done