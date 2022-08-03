#!/usr/bin/env bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')
GREEN=0xFFa3be8c
ORANGE=0xFFd08770
RED=0xFFbf616a
YELLOW=0xFFebcb8b

if [[ $CHARGING != "" ]]; then
	ICON=""
	sketchybar -m --set ${NAME} \
		icon=$ICON \
		icon.color=$GREEN \
		label=$(printf "${BATT_PERCENT}%%")
	exit 0
fi

case ${BATT_PERCENT} in
100) ICON="" && COLOR=$GREEN ;;
9[0-9]) ICON="" && COLOR=$GREEN ;;
8[0-9]) ICON="" && COLOR=$GREEN ;;
7[0-9]) ICON="" && COLOR=$GREEN ;;
6[0-9]) ICON="" && COLOR=$ORANGE ;;
5[0-9]) ICON="" && COLOR=$ORANGE ;;
4[0-9]) ICON="" && COLOR=$ORANGE ;;
3[0-9]) ICON="" && COLOR=$ORANGE ;;
2[0-9]) ICON="" && COLOR=$RED ;;
1[0-9]) ICON="" && COLOR=$RED ;;
[0-9]) ICON="" && COLOR=$RED ;;
*) ICON="" ;;
esac

sketchybar -m --set ${NAME} \
	icon=$ICON \
	icon.color=$COLOR \
	label=$(printf "${BATT_PERCENT}%%")
