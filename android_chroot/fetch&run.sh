#!/bin/bash

REPO_DIR="./nixScript"
CHECK_INTERVAL=5

while true; do
    cd $REPO_DIR
    git fetch origin

    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})

    if [ $LOCAL != $REMOTE ]; then
        cd nixScript/android_chroot
        git reset --hard
        git pull
        sh copy.sh
        cd
        sudo sh install.sh
    fi

    cd - > /dev/null
    sleep $CHECK_INTERVAL
done