#!/usr/bin/env bash

echo "$(vpn st | jq -r .text 2>/dev/null)"

case "$BLOCK_BUTTON" in
    1) st -e vpn tog ;;
esac
