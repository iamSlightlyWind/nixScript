#!/bin/bash

spacer=">>>"
set -e

if [ ! -z $(command -v cloudflared) ]; then
    echo "$spacer cloudflared already installed, continuing"
    hasCloudflared=1
else
    echo "$spacer cloudflared not found, installing using AUR"
    if [ ! -z $(command -v paru) ]; then
        echo "$spacer using paru..."
        paru -S cloudflared --noconfirm
    elif [ ! -z $(command -v yay) ]; then
        echo "$spacer paru not found, using yay..."
        yay -S cloudflared --noconfirm
    else
        echo "$spacer neither paru or yay was found"
        echo "$spacer either install pary, yay or install cloudflared yourself"
    fi
fi

[ ! -z $(command -v cloudflared) ] && echo "$spacer cloudflared not installed, exiting" && exit 1

cloudflared login