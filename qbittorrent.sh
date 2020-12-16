#!/bin/bash

# qbittorrent autostart minimize kde
pgrep '^qbittorrent$' || qbittorrent &> /dev/null &
sleep 2
xdotool search --class qbittorrent windowclose

[[ -z $(jobs) ]] || disown
exit 0
 
