#!/usr/bin/env bash

pct=$(brightnessctl -m | awk -F, '{print substr($4,1,length($4)-1)}')
icons=(🌑 🌘 🌗 🌖 🌕)
idx=$(( pct * (${#icons[@]} - 1) / 100 ))
printf "%s %s%%\n" "${icons[idx]}" "$pct"

case "$BLOCK_BUTTON" in
    1) brightnessctl set +5%;;
    3) brightnessctl set 5%-;;
esac
