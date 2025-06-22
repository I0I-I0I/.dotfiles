#!/usr/bin/env bash

iface="wlp1s0"
ip=$(ip -4 addr show dev "$iface" \
     | awk '/inet /{print $2}')
read -r net_name net_type <<< $(nmcli connection | awk '{print $1, $3}' | head -2 | tail -1)

if [ "$net_type"=="wifi" ]; then
    icon=""
else
    icon="󰈁"
fi

if [ -n "$ip" ]; then
    echo "$icon $net_name"
else
    echo " "
fi

case "$BLOCK_BUTTON" in
    1) st -e nmtui ;;
esac
