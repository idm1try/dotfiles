#!/bin/bash

APP_TITLE=$(yabai -m query --windows --window | jq -r '.app')
WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')

# Truncate a long window title
if [[ ${#WINDOW_TITLE} -gt 70 ]]; then
	WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)…
fi

# If both app and window title are available, use a separator
if [[ $APP_TITLE != "" && $WINDOW_TITLE != "" ]]; then
	sketchybar -m --set title label="$APP_TITLE | $WINDOW_TITLE"
	exit 0
fi

sketchybar -m --set title label="$APP_TITLE $WINDOW_TITLE"
