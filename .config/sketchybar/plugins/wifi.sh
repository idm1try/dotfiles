#!/bin/bash

name=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | sed -n 's/^.*SSID: \(.*\)$/\1/p')

if [ -z "$name" ]; then
	sketchybar -m --set $NAME label="Disconnected"
else
	sketchybar -m --set $NAME label="$name $(ipconfig getifaddr en0)"
fi
