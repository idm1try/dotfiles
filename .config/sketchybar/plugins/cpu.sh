#!/bin/bash
sketchybar -m --set $NAME label="$(iostat -c 2 disk0 | sed '/^\s*$/d' | tail -n 1 | awk -v format="%3.1f%%" '{usage=100-$6} END {printf(format, usage)}' | sed 's/,/./')"
