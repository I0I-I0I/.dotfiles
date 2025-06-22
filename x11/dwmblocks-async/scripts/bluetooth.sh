#!/usr/bin/env bash

# show a BT icon if any device is connected
if bluetoothctl info | grep -q "Connected: yes"; then
    echo ""
else
    echo ""
fi

case "$BLOCK_BUTTON" in
    1) st -e bluetui ;;  # open bluetui
esac
