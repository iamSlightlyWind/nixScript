#!/bin/bash
while true; do
    sudo /usr/bin/ryzenadj -f $(cat /home/slightlywind/Repositories/nixScript/bootScript/temp)
    sleep 5
done

