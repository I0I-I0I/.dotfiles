#!/usr/bin/env bash

status=$(vpnst | jq -r .class 2>/dev/null)
case "$status" in
    connected)    echo " VPN" ;;
    disconnected) echo " VPN" ;;
    *)            echo "ERROR VPN" ;;
esac

case "$BLOCK_BUTTON" in
    1) st -e ~/.dotfiles/scripts/vpntog ;;
esac
