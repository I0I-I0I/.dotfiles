#!/usr/bin/env bash

# Check if Bluetooth is enabled
bluetooth_status=$(bluetoothctl show | grep -q "Powered: yes" && echo "on" || echo "off")

# Get connected device info (name + battery)
if [ "$bluetooth_status" = "on" ]; then
    connected_device=$(bluetoothctl info | awk -F': ' '/Alias:/ {print $2}')
    battery_percent=$(bluetoothctl info | awk -F': ' '/Battery Percentage:/ {print $2}' | tr -d '()' | awk '{print $2}')
fi

# Format output based on status
case "$bluetooth_status" in
    "on")
        if [ -n "$connected_device" ]; then
            # Format: Icon + Battery % (if device connected)
            echo " ${battery_percent}%"
        else
            # Format: Just icon (Bluetooth on but no device connected)
            echo ""
        fi
        ;;
    "off")
        # Format: Disabled icon
        echo "󰂲"
        ;;
esac

case "$BLOCK_BUTTON" in
    1) st -e bluetui ;;  # open bluetui
esac
