#!/bin/bash
find /media/sdx1/cpiscos/private/rtorrent/data/.complete/ -type d -empty -delete
if ! screen -list | grep -q "rmove"; then
screen -dmS rmove ~/scripts/.torrents
fi
