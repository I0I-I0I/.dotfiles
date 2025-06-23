#!/usr/bin/env bash

# get volume and mute state
read -r vol mute <<< "$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' && echo "$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')")"
icon=""
if [ "$mute" = "yes" ]; then
    icon=""
elif [ "${vol%\%}" -gt 75 ]; then
    icon=""
elif [ "${vol%\%}" -gt 45 ]; then
    icon=""
else
    icon=""
fi

printf "%s %s\n" "$icon" "$vol"

case "$BLOCK_BUTTON" in
    1) pactl set-sink-volume @DEFAULT_SINK@ +5%;;
    3) pactl set-sink-volume @DEFAULT_SINK@ -5%;;
esac
